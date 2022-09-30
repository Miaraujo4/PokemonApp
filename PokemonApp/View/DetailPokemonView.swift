//
//  DetailPokemonView.swift
//  PokemonApp
//
//  Created by Milena Araujo on 29/09/22.
//

import Foundation
import UIKit

class DetailPokemonView: UIView {
    
    // MARK: - Private UI Properties
    private var imageDetailPokemon: UIImageView = {
        let image: UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var nameDetailLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descripcionDetailLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 20
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var abilityDetailLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    func setHierarchy() {
        [imageDetailPokemon, nameDetailLabel,
         descripcionDetailLabel, abilityDetailLabel].forEach { view in
            self.addSubview(view)
        }
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageDetailPokemon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageDetailPokemon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageDetailPokemon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            imageDetailPokemon.heightAnchor.constraint(equalToConstant: 200),
            
            nameDetailLabel.topAnchor.constraint(equalTo: imageDetailPokemon.bottomAnchor, constant: 40),
            nameDetailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            descripcionDetailLabel.topAnchor.constraint(equalTo: nameDetailLabel.bottomAnchor, constant: 20),
            descripcionDetailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descripcionDetailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            abilityDetailLabel.topAnchor.constraint(equalTo: descripcionDetailLabel.bottomAnchor, constant: 20),
            abilityDetailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
}
