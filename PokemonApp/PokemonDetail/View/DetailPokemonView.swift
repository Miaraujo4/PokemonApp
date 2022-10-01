//
//  DetailPokemonView.swift
//  PokemonApp
//
//  Created by Milena Araujo on 29/09/22.
//

import Foundation
import UIKit

final class DetailPokemonView: UIView {
    
    // MARK: - Private Properties
    private var viewModel: DetailPokemonViewModel?
    
    // MARK: - Private UI Properties
    private var imageDetailPokemon: UIImageView = {
        let image: UIImageView = UIImageView()
        image.backgroundColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var nameDetailLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descripcionDetailLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 20
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var abilityDetailLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setHierarchy()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    private func setHierarchy() {
        [imageDetailPokemon, nameDetailLabel,
         descripcionDetailLabel, abilityDetailLabel].forEach { view in
            self.addSubview(view)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageDetailPokemon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
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
    
    // MARK: - Private Functions
    func setViewModel(viewModel: DetailPokemonViewModel) {
        nameDetailLabel.text = viewModel.detailName
        imageDetailPokemon.load(url: viewModel.detailImage)
        abilityDetailLabel.text = viewModel.detailAbility
        descripcionDetailLabel.text = viewModel.description
    }
    
}
