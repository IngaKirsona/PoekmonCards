//
//  PokemonShowViewController.swift
//  PoekmonCards
//
//  Created by Inga Kirsona on 15/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class PokemonShowViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
   
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonNumber: UILabel!
    @IBOutlet weak var pokemonSet: UILabel!
    @IBOutlet weak var pokemonHp: UILabel!
    @IBOutlet weak var pokemonSeries: UILabel!
    
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let pokemon = pokemon {
            ImageController.getImage(for: pokemon.imageUrl ?? "", completion: { (image) in
                self.imageView.image = image
            })
        }else{
            print("pokemon image is nil")
        }
        pokemonName.text = pokemon?.name
        pokemonNumber.text = pokemon?.number
        pokemonSet.text = pokemon?.pokemonSet
        pokemonSeries.text = pokemon?.series
        pokemonHp.text = pokemon?.hp
    }
    
}

