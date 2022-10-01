//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by Milena Araujo on 28/09/22.
//

import Foundation

final class PokemonViewModel {

    // -MARK: Private Properties
    private let service: PokemonServiceProtocol
    private var pokemonDescriptionList: [PokemonDescription] = [PokemonDescription]()
    private(set) var presentationLayout: PresentationLayout = .MultiplePokemonInRow
    private(set) var pokemonList: [Pokemon] = [Pokemon]()
    
    // -MARK: Properties
    var position: Int = 0
    
    // -MARK: Delegate
    weak var delegate: CollectionPokemonViewControllerDelegate?
    
    // -MARK: Init
    init(service: PokemonServiceProtocol = PokemonService()) {
        self.service = service
    }
    
    // -MARK: Computed Properties
    var name: String {
        guard pokemonList.indices.contains(position) else {
            return ""
        }
        return (pokemonList[position].name).firstUppercased
    }
 
    var image: URL {
        guard pokemonList.indices.contains(position),
            let url = URL(string: pokemonList[position].image.image) else {
            return URL(fileURLWithPath: String())
        }
        return url
    }
    
    var rightButtonImage: String {
        switch presentationLayout {
        case .MultiplePokemonInRow:
            return "multiplePresentation"
        case .singlePokemonInRow:
            return "listPresentation"
        }
    }
    
    // -MARK: Functions
    func itemWasSelected(position: Int) {
        guard pokemonList.indices.contains(position) else {
            return
        }
        let pokemon: Pokemon = pokemonList[position]
        let pokemonDescription: PokemonDescription = pokemonDescriptionList[position]
        delegate?.goToDetailScreen(pokemon: pokemon, pokemonDescription: pokemonDescription)
    }
    
    func getPokemonList() {
        service.getPokemonList() { [weak self] result in
            switch result {
            case .success(let pokemonData):
                self?.pokemonList = pokemonData
                self?.service.getDescriptionPokemons(pokemonDescription: pokemonData) { result in
                        switch result {
                        case .success(let description):
                            self?.pokemonDescriptionList = description
                        case .failure(let error):
                            self?.handleError(error: error)
                        }
                    }
                self?.delegate?.canReloadView()
            case .failure(let error):
                self?.handleError(error: error)
            }
        }
    }
    
    func handleError(error: ErrorRequest) {
        switch error {
        case .errorDecoding:
            delegate?.errorRequest(title: "Error", description: "Decoding not work")
        case .requestError:
            delegate?.errorRequest(title: "Error", description: "Service problem")
        }
    }
    
    func changePresentationLayout() {
        presentationLayout = presentationLayout.switchLayout()
    }
}
