//
//  PokemonAbilitiesMock.swift
//  PokemonAppTests
//
//  Created by Milena Araujo on 01/10/22.
//

import Foundation
@testable import PokemonApp

extension PokemonAbilities {
    static func mock(name: String) -> PokemonAbilities {
        return PokemonAbilities(ability: Ability.mock(name: name))
    }
}
