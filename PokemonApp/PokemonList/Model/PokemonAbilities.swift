//
//  PokemonAbilities.swift
//  PokemonApp
//
//  Created by Milena Araujo on 30/09/22.
//

import Foundation

struct PokemonAbilities: Decodable {
    let ability: Ability
}

struct Ability: Decodable {
    let name: String
}

struct Species: Decodable {
    let url: String
}
