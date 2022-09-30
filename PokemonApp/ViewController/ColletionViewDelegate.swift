//
//  CollectionViewDelegate.swift
//  PokemonApp
//
//  Created by Milena Araujo on 28/09/22.
//

import Foundation
import UIKit

final class CollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var viewModel: PokemonViewModel = PokemonViewModel()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = viewModel.presentationLayout == .MultiplePokemonInRow ? collectionView.frame.width * 0.39 : collectionView.frame.width
        return CGSize(width: width, height: 120)
    }
}
