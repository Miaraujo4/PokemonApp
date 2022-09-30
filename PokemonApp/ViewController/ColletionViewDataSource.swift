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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PokemonCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.cellIdentifier, for: indexPath) as! PokemonCollectionViewCell
        cell.pokemonNameLabel.text = viewModel.name
        cell.pokemonImage.image = viewModel.image
        return cell
    }
}
