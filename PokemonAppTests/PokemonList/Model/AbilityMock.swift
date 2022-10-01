//
//  AbilityMock.swift
//  PokemonAppTests
//
//  Created by Milena Araujo on 01/10/22.
//

import Foundation
@testable import PokemonApp

extension Ability {
    static func mock(name: String) -> Ability {
        return Ability(name: name)
    }
}
