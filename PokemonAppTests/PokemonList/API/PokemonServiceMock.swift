//
//  PokemonServiceMock.swift
//  PokemonAppTests
//
//  Created by Milena Araujo on 01/10/22.
//

import Foundation
@testable import PokemonApp

final class PokemonServiceMock: PokemonServiceProtocol {
    
    var shouldFailRequest: Bool = false
    
    func getPokemonList(completionHandler: @escaping (Result<[Pokemon], ErrorRequest>) -> Void) {
        if shouldFailRequest {
            completionHandler(.failure(.requestError))
        } else {
            completionHandler(.success(Pokemon.mockArray()))
        }
    }
    
    func getDescriptionPokemons(pokemonDescription: [Pokemon], completionHandler: @escaping (Result<[PokemonDescription], ErrorRequest>) -> Void) {
        if shouldFailRequest {
            completionHandler(.failure(.requestError))
        } else {
            completionHandler(.success(PokemonDescription.mockArray()))
        }
    }
    
    
}
