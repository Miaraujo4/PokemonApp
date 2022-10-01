//
//  PokemonCollectionViewCell.swift
//  PokemonApp
//
//  Created by Milena Araujo on 28/09/22.
//

import Foundation
import UIKit

final class PokemonCollectionViewCell: UICollectionViewCell {
    
    // -MARK: - Static Properties
    static let cellIdentifier: String = "PokemonCell"
    
    // -MARK: - UI Private Properties
    private var pokemonNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.backgroundColor = UIColor(red: 0, green: 0.749, blue: 0.898, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var pokemonImage: UIImageView = {
        let image: UIImageView = UIImageView()
        image.backgroundColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // -MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        setHierarchy()
        setConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // -MARK: - Functions
    private func setHierarchy() {
        contentView.addSubview(pokemonImage)
        contentView.addSubview(pokemonNameLabel)
    }
    
    private func setConstraint() {
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
    
    func setViewModel(viewModel: PokemonViewModel) {
        pokemonNameLabel.text = viewModel.name
        pokemonImage.load(url: viewModel.image)
        pokemonImage.contentMode = .scaleAspectFit
    }
}
