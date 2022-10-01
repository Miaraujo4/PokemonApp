//
//  CollectionViewDataSource.swift
//  PokemonApp
//
//  Created by Milena Araujo on 28/09/22.
//

import Foundation
import UIKit

final class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    // -MARK: Properties
    var viewModel: PokemonViewModel = PokemonViewModel()
    
    // -MARK: Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PokemonCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.cellIdentifier, for: indexPath) as? PokemonCollectionViewCell else {
            return UICollectionViewCell()
        }
        viewModel.position = indexPath.item
        cell.setViewModel(viewModel: viewModel)
        return cell
    }
}
