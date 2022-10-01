//
//  PresentationLayout.swift
//  PokemonApp
//
//  Created by Milena Araujo on 30/09/22.
//

import Foundation

enum PresentationLayout {
    case singlePokemonInRow
    case MultiplePokemonInRow
    
    func switchLayout() -> PresentationLayout {
        switch self {
        case .singlePokemonInRow:
            return .MultiplePokemonInRow
        case .MultiplePokemonInRow:
            return .singlePokemonInRow
        }
    }
}
