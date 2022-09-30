//
//  DetailPokemonViewController.swift
//  PokemonApp
//
//  Created by Milena Araujo on 29/09/22.
//

import UIKit

class DetailPokemonViewController: UIViewController {
    var detailPokemonView: DetailPokemonView = DetailPokemonView()
    
    override func loadView() {
        self.view = detailPokemonView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
