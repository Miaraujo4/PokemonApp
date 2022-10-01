//
//  PokemonDescription.swift
//  PokemonApp
//
//  Created by Milena Araujo on 30/09/22.
//

import Foundation

struct PokemonDescriptions: Decodable {
    var description: String
    var language: Language
    
    enum CodingKeys: String, CodingKey {
        case description = "flavor_text"
        case language
    }
}

struct Language: Decodable {
    var name: String
}
