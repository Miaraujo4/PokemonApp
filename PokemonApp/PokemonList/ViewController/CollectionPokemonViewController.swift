//
//  CollectionPokemonViewController.swift
//  PokemonApp
//
//  Created by Milena Araujo on 28/09/22.
//

import UIKit

protocol CollectionPokemonViewControllerDelegate: AnyObject {
    func canReloadView()
    func goToDetailScreen(pokemon: Pokemon, pokemonDescription: PokemonDescription)
    func errorRequest(title: String, description: String)
}

final class CollectionPokemonViewController: UIViewController {
    
    // -MARK: Private UI properties
    private var pokemonView: PokemonView = PokemonView()
    private var rightButton: UIBarButtonItem = UIBarButtonItem()
    
    // -MARK: Private properties
    private var viewModel: PokemonViewModel
    
    // -MARK: Init
    init(viewModel: PokemonViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // -MARK: Lifecycle
    override func loadView() {
        self.view = pokemonView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configureNavigationBar()
        viewModel.getPokemonList()
        pokemonView.setViewModel(viewModel: viewModel)
    }
    
    // -MARK: Functions
    func configureNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        self.navigationItem.title = "Pokemon App"
        rightButton = UIBarButtonItem(image: UIImage(named: viewModel.rightButtonImage),
                                      style: .done,
                                      target: self,
                                      action: #selector(changeLayoutPresentation))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc
    private func changeLayoutPresentation() {
        viewModel.changePresentationLayout()
        pokemonView.updateView()
        rightButton.image = UIImage(named: viewModel.rightButtonImage)
    }
}

extension CollectionPokemonViewController: CollectionPokemonViewControllerDelegate {
    // -MARK: Functions
    func canReloadView() {
        pokemonView.updateView()
    }
    
    func goToDetailScreen(pokemon: Pokemon, pokemonDescription: PokemonDescription) {
        let viewModel = DetailPokemonViewModel(pokemon: pokemon, pokemonDescription: pokemonDescription)
        let detailViewController: DetailPokemonViewController = DetailPokemonViewController(viewModel: viewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func errorRequest(title: String, description: String) {
        let alertError: UIAlertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default)
        alertError.addAction(okButton)
        self.present(alertError, animated: true)
    }
}
