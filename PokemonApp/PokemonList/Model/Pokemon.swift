//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Milena Araujo on 30/09/22.
//

import Foundation

struct Pokemon: Decodable {
    var name: String
    var image: PokemonImage
    var abilities: [PokemonAbilities]
    var species: Species
    
    enum CodingKeys: String, CodingKey {
        case name
        case image = "sprites"
        case abilities
        case species
    }
}

struct PokemonDescription: Decodable {
    var description: [PokemonDescriptions]
    
    enum CodingKeys: String, CodingKey {
        case description = "flavor_text_entries"
    }
}
