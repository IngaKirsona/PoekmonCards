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
            print("pokemon image is nil!")
        }
        
        if pokemon?.name != nil{
            pokemonName.text = pokemon?.name
        }else{print("No name for pokemon!")}
        if pokemon?.number != nil{
            pokemonNumber.text = pokemon?.number
        }else{print("This pokemon has no number!")}
        if pokemon?.series != nil{
            pokemonSeries.text = pokemon?.series
        }else{print("This pokemon has no series!")}
        if pokemon?.pokemonSet != nil{
            pokemonSet.text = pokemon?.pokemonSet
        }else{print("This pokemon has no set!")}
        if pokemon?.hp != nil{
            pokemonHp.text = pokemon?.hp
        }else{print("This pokemon has no hp!")}
    }
}

