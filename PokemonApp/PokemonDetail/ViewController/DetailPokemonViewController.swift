//
//  DetailPokemonViewController.swift
//  PokemonApp
//
//  Created by Milena Araujo on 29/09/22.
//

import UIKit

final class DetailPokemonViewController: UIViewController {
    
    // MARK: - Private Properties
    private var detailPokemonView: DetailPokemonView = DetailPokemonView()
    private let viewModel: DetailPokemonViewModel
    
    // MARK: - Init
    init(viewModel: DetailPokemonViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func loadView() {
        self.view = detailPokemonView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        detailPokemonView.setViewModel(viewModel: viewModel)
    }
}
