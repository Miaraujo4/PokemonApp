//
//  CollectionPokemonViewController.swift
//  PokemonApp
//
//  Created by Milena Araujo on 28/09/22.
//

import UIKit

class CollectionPokemonViewController: UIViewController {
    
    // -MARK: Private UI properties
    private var pokemonView: PokemonView = PokemonView()
    private var rightButton: UIBarButtonItem = UIBarButtonItem()
    
    // -MARK: Private properties
    private var viewModel: PokemonViewModel = PokemonViewModel()
    
    // -MARK: Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
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
        configureNavigationBar()
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
        rightButton = UIBarButtonItem(image: viewModel.rightButtonImage,
                                      style: .done,
                                      target: self,
                                      action: #selector(changeLayoutPresentation))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc
    private func changeLayoutPresentation() {
        viewModel.changePresentationLayout()
        pokemonView.updatePresentationLayout()
        rightButton.image = viewModel.rightButtonImage
    }
}

