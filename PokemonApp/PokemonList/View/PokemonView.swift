//
//  PokemonView.swift
//  PokemonApp
//
//  Created by Milena Araujo on 28/09/22.
//

import Foundation
import UIKit

final class PokemonView: UIView {
    
    // MARK: - Private Properties
    private var dataSourceCollectionView: CollectionViewDataSource = CollectionViewDataSource()
    private var delegateCollectionView: CollectionViewDelegate = CollectionViewDelegate()
    private var viewModel: PokemonViewModel?
    
    
    // MARK: - Private UI Properties
    private var pokemonCollectionView: UICollectionView = {
        let collectionLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.sectionInset = UIEdgeInsets(top: 5, left: 28, bottom: 2, right: 28)
        collectionLayout.minimumLineSpacing = 8
        collectionLayout.minimumInteritemSpacing = 10
        
        let colleticonView: UICollectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionLayout
        )
        colleticonView.register(PokemonCollectionViewCell.self,
                                forCellWithReuseIdentifier: PokemonCollectionViewCell.cellIdentifier)
        colleticonView.translatesAutoresizingMaskIntoConstraints = false
        return colleticonView
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setHierarchy()
        setConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    private func setHierarchy() {
        self.addSubview(pokemonCollectionView)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            pokemonCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            pokemonCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pokemonCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pokemonCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    // MARK: - Functions
    func setViewModel(viewModel: PokemonViewModel) {
        self.viewModel = viewModel
        dataSourceCollectionView.viewModel = viewModel
        delegateCollectionView.viewModel = viewModel
        pokemonCollectionView.dataSource = dataSourceCollectionView
        pokemonCollectionView.delegate = delegateCollectionView
        pokemonCollectionView.reloadData()
    }
    
    func updateView() {
        pokemonCollectionView.reloadData()
    }
}
