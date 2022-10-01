//
//  PokemonMock.swift
//  PokemonAppTests
//
//  Created by Milena Araujo on 01/10/22.
//

import Foundation
@testable import PokemonApp

extension Pokemon {
    static func mock() -> Pokemon {
        return Pokemon(name: "pikachu", image: PokemonImage.mock(by: "pikachu"), abilities: [PokemonAbilities.mock(name: "Thunder"), PokemonAbilities.mock(name: "fast attack")], species: Species.mock(name: "pikachu"))
    }
    
    static func mockArray() -> [Pokemon] {
        let pokemonArray: [Pokemon] = [
            Pokemon(name: "pikachu", image: PokemonImage.mock(by: "pikachu"), abilities: [PokemonAbilities.mock(name: "Thunder"), PokemonAbilities.mock(name: "fast attack")], species: Species.mock(name: "pikachu")),
            Pokemon(name: "bulbasaur", image: PokemonImage.mock(by: "bulbasaur"), abilities: [PokemonAbilities.mock(name: "overgrow"), PokemonAbilities.mock(name: "chlorophyll")], species: Species.mock(name: "bulbasaur")),
            Pokemon(name: "squirtle", image: PokemonImage.mock(by: "squirtle"), abilities: [PokemonAbilities.mock(name: "torrent"), PokemonAbilities.mock(name: "rain-dish")], species: Species.mock(name: "squirtle")),
            Pokemon(name: "charmander", image: PokemonImage.mock(by: "charmander"), abilities: [PokemonAbilities.mock(name: "solar-power"), PokemonAbilities.mock(name: "blaze")], species: Species.mock(name: "charmander"))
        ]
        return pokemonArray
    }
}

extension PokemonDescription {
    
    static func mock() -> PokemonDescription {
        return PokemonDescription(description: [
            PokemonDescriptions.mockDescription(description: "Very strong", language: "en"),
            PokemonDescriptions.mockDescription(description: "Confident", language: "br")
        ])
    }
    
    static func mockArray() -> [PokemonDescription] {
        return [
            PokemonDescription(description: [
                PokemonDescriptions.mockDescription(description: "Very strong", language: "en"),
                PokemonDescriptions.mockDescription(description: "Confident", language: "es")
            ]),
            PokemonDescription(description: [
                PokemonDescriptions.mockDescription(description: "Very strong", language: "en"),
                PokemonDescriptions.mockDescription(description: "Confident", language: "es")
            ]),
            PokemonDescription(description: [
                PokemonDescriptions.mockDescription(description: "Very strong", language: "en"),
                PokemonDescriptions.mockDescription(description: "Confident", language: "br")
            ]),
            PokemonDescription(description: [
                PokemonDescriptions.mockDescription(description: "Very strong", language: "en"),
                PokemonDescriptions.mockDescription(description: "Confident", language: "es")
            ])
        ]
    }
}
