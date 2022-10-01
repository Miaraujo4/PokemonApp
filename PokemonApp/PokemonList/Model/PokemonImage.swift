//
//  PokemonImage.swift
//  PokemonApp
//
//  Created by Milena Araujo on 30/09/22.
//

import Foundation

struct PokemonImage: Decodable {
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case image = "front_default"
    }
}
