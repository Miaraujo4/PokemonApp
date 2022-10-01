//
//  PokemonImageMock.swift
//  PokemonAppTests
//
//  Created by Milena Araujo on 01/10/22.
//

import Foundation
@testable import PokemonApp

extension PokemonImage {
    static func mock(by pokemon: String) -> PokemonImage {
        return PokemonImage(image: "http://pokemonImage.com/\(pokemon)")
    }
}
