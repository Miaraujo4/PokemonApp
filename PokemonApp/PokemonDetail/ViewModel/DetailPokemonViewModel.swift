//
//  DetailPokemonViewModel.swift
//  PokemonApp
//
//  Created by Milena Araujo on 30/09/22.
//

import Foundation
import UIKit

final class DetailPokemonViewModel {
    
    // MARK: - Private Properties
    private var pokemon: Pokemon
    private var pokemonDescription: PokemonDescription
    
    // MARK: - Init
    init(pokemon: Pokemon, pokemonDescription: PokemonDescription) {
        self.pokemon = pokemon
        self.pokemonDescription = pokemonDescription
    }
    
    // MARK: - Computed Properties
    var detailName: String {
        return (pokemon.name).firstUppercased
    }
    
    var detailImage: URL {
        return URL(string: pokemon.image.image) ?? URL(fileURLWithPath: String())
    }
    
    var detailAbility: String {
        var abilities: String = "Abilities: \n"
        for data in pokemon.abilities {
            abilities = abilities + "\(data.ability.name)\n"
        }
        return abilities
    }
    
    var description: String {
        for position in 0...pokemonDescription.description.count {
            if pokemonDescription.description[position].language.name == "en" {
                return (pokemonDescription.description[position].description).firstUppercased
            }
        }
        return ""
    }
}

