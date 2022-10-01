//
//  PokemonDescriptionMock.swift
//  PokemonAppTests
//
//  Created by Milena Araujo on 01/10/22.
//

import Foundation
@testable import PokemonApp

extension PokemonDescriptions {
    static func mockDescription(description: String, language: String) -> PokemonDescriptions {
        return PokemonDescriptions(description: description, language: Language.mockLanguage(name: language))
    }
}

extension Language {
    static func mockLanguage(name: String) -> Language {
        return Language(name: name)
    }
}
