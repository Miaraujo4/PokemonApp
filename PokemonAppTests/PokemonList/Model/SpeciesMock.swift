//
//  SpeciesMock.swift
//  PokemonAppTests
//
//  Created by Milena Araujo on 01/10/22.
//

import Foundation
@testable import PokemonApp

extension Species {
    static func mock(name: String) -> Species {
        return Species(url: "http://pokemonImage.com/specie/\(name)")
    }
}
