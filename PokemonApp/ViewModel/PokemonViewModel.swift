//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by Milena Araujo on 28/09/22.
//

import Foundation
import UIKit

final class PokemonViewModel {

    private(set) var presentationLayout: PresentationLayout = .MultiplePokemonInRow
    
    var name: String {
        return "Caneta"
    }
    
    var rightButtonImage: UIImage {
        var imageName: String = String()
        switch presentationLayout {
        case .MultiplePokemonInRow:
            imageName = "multiplePresentation"
        case .singlePokemonInRow:
            imageName = "listPresentation"
        }
        return UIImage(named: imageName) ?? UIImage()
    }
    
    var image: UIImage? {
        return UIImage(systemName: "pencil")
    }
    
    func changePresentationLayout() {
        presentationLayout = presentationLayout.switchLayout()
    }
}
