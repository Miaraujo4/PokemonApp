//
//  Uppercase.swift
//  PokemonApp
//
//  Created by Milena Araujo on 01/10/22.
//

import Foundation

extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
