//
//  PokemonViewModelTest.swift
//  PokemonAppTests
//
//  Created by Milena Araujo on 01/10/22.
//

import XCTest
@testable import PokemonApp

final class PokemonViewModelTest: XCTestCase {
    
    var viewModel: PokemonViewModel!
    var service: PokemonServiceMock!
    
    override func setUpWithError() throws {
        service = PokemonServiceMock()
        viewModel = PokemonViewModel(service: service)
        viewModel.delegate = self
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testInitialStateViewModel() {
        XCTAssertTrue(viewModel.pokemonList.isEmpty)
        XCTAssertTrue(viewModel.presentationLayout == .MultiplePokemonInRow)
        XCTAssertTrue(viewModel.position == 0)
        XCTAssertTrue(viewModel.name.isEmpty)
        XCTAssertTrue(viewModel.image == URL(fileURLWithPath: String()))
        XCTAssertTrue(viewModel.rightButtonImage == "multiplePresentation")
    }
    
    func testGetPokemonList() {
        service.shouldFailRequest = false
        viewModel.getPokemonList()
        XCTAssertFalse(viewModel.pokemonList.isEmpty)
    }
    
    func testGetPokemonListWithError() {
        service.shouldFailRequest = true
        viewModel.getPokemonList()
        XCTAssertTrue(viewModel.pokemonList.isEmpty)
    }
    
    func testHandleErrorRequestError() {
        viewModel.handleError(error: .requestError)
    }
    
    func testChangePresentationLayout() {
        viewModel.changePresentationLayout()
        XCTAssertTrue(viewModel.presentationLayout == .singlePokemonInRow)
    }
    
    func testNameAfterService() {
        service.shouldFailRequest = false
        viewModel.getPokemonList()
        XCTAssertEqual(viewModel.name, "pikachu".firstUppercased)
    }
    
    func testImageAfterService() {
        service.shouldFailRequest = false
        viewModel.getPokemonList()
        XCTAssertEqual(viewModel.image, URL(string: "http://pokemonImage.com/pikachu")!)
    }
    
    func testItemSelect() {
        viewModel.itemWasSelected(position: 1)
    }
}

extension PokemonViewModelTest: CollectionPokemonViewControllerDelegate {
    func canReloadView() {
        let functionCalled: Bool = true
        XCTAssertTrue(functionCalled)
    }
    
    func goToDetailScreen(pokemon: Pokemon, pokemonDescription: PokemonDescription) {
        XCTAssertEqual(pokemon.name, "bulbasaur")
        XCTAssertEqual(pokemonDescription.description[1].description, "Confident")
    }
    
    func errorRequest(title: String, description: String) {
        XCTAssertEqual(title, "Error")
        XCTAssertEqual(description, "Service problem")
    }
}
