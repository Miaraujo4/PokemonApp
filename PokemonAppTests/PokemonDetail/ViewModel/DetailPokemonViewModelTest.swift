//
//  DetailPokemonViewModelTest.swift
//  PokemonAppTests
//
//  Created by Milena Araujo on 01/10/22.
//

import XCTest
@testable import PokemonApp

class DetailPokemonViewModelTest: XCTestCase {
    
    var viewModel: DetailPokemonViewModel!

    override func setUpWithError() throws {
        viewModel = DetailPokemonViewModel(pokemon: Pokemon.mock(), pokemonDescription: PokemonDescription.mock())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testDetailNameProperty() {
        XCTAssertEqual(viewModel.detailName, "pikachu".firstUppercased)
    }
    
    func testDetailImageProperty() {
        XCTAssertEqual(viewModel.detailImage, URL(string: "http://pokemonImage.com/pikachu"))
    }
    
    func testDetailAbilityProperty() {
        XCTAssertEqual(viewModel.detailAbility, "Abilities: \nThunder\nfast attack\n")
    }
    
    func testDetailDescriptionProperty() {
        XCTAssertEqual(viewModel.description, "Very strong")
    }

}
