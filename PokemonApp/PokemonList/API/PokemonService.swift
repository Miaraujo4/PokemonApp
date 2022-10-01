//
//  PokemonService.swift
//  PokemonApp
//
//  Created by Milena Araujo on 30/09/22.
//

import Alamofire
import Foundation

protocol PokemonServiceProtocol {
    func getPokemonList(completionHandler: @escaping(Result<[Pokemon], ErrorRequest>) -> Void)
    func getDescriptionPokemons(pokemonDescription: [Pokemon], completionHandler: @escaping(Result<[PokemonDescription], ErrorRequest>) -> Void)
}

final class PokemonService: PokemonServiceProtocol {
    // -MARK: Private Properties
    private var pokemonList: [Pokemon] = [Pokemon]()
    private var pokemonDescription: [PokemonDescription] = [PokemonDescription]()
    
    // -MARK: Functions
    func getPokemonList(completionHandler: @escaping(Result<[Pokemon], ErrorRequest>) -> Void) {
        AF.request("https://pokeapi.co/api/v2/pokemon", method: .get).response { [weak self] response in
            switch response.result {
            case .success(let data):
                do {
                    let pokemonResults: PokemonResult = try JSONDecoder().decode(PokemonResult.self, from: data!)
                    self?.getPokemons(pokemonsURLs: pokemonResults.results, completionHandler: completionHandler)
                } catch {
                    completionHandler(.failure(.errorDecoding))
                }
            case .failure(_):
                completionHandler(.failure(.requestError))
            }
        }
    }
    
    func getDescriptionPokemons(pokemonDescription: [Pokemon], completionHandler: @escaping (Result<[PokemonDescription], ErrorRequest>) -> Void) {
        for pokemon in pokemonDescription {
            AF.request(pokemon.species.url,
                       method: .get).response { response in
                switch response.result {
                case .success(let data):
                    do {
                        guard let data: Data = data else {
                            completionHandler(.failure(.requestError))
                            return
                        }
                        let description: PokemonDescription = try JSONDecoder().decode(PokemonDescription.self, from: data)
                        self.pokemonDescription.append(description)
                        completionHandler(.success(self.pokemonDescription))
                    } catch {
                        completionHandler(.failure(.errorDecoding))
                    }
                case .failure(_):
                    completionHandler(.failure(.requestError))
                }
            }
        }
    }
}

private extension PokemonService {
    func getPokemons(pokemonsURLs: [PokemonsURL], completionHandler: @escaping(Result<[Pokemon], ErrorRequest>) -> Void) {
        let lastPokemon: PokemonsURL = pokemonsURLs.last ?? PokemonsURL(url: String())
        for pokemonURL in pokemonsURLs {
            AF.request(pokemonURL.url, method: .get).response { [weak self] response in
                switch response.result {
                case .success(let data):
                    do {
                        guard let data: Data = data else {
                            completionHandler(.failure(.requestError))
                            return
                        }
                        let pokemon: Pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                        self?.pokemonList.append(pokemon)
                        if lastPokemon.url == pokemonURL.url {
                            completionHandler(.success(self?.pokemonList ?? [Pokemon]()))
                        }
                    } catch {
                        completionHandler(.failure(.errorDecoding))
                    }
                case .failure(_):
                    completionHandler(.failure(.requestError))
                }
            }
        }
    }
}



