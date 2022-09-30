//
//  PokemonCollectionViewCell.swift
//  PokemonApp
//
//  Created by Milena Araujo on 28/09/22.
//

import Foundation
import UIKit

final class PokemonCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier: String = "PokemonCell"
    
    // MARK: - UI Properties
    var pokemonNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var pokemonImage: UIImageView = {
        let image: UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        setHierarchy()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    func setHierarchy() {
        contentView.addSubview(pokemonImage)
        contentView.addSubview(pokemonNameLabel)
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            pokemonImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pokemonImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pokemonImage.bottomAnchor.constraint(equalTo: pokemonNameLabel.topAnchor),
            
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pokemonNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            pokemonNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
