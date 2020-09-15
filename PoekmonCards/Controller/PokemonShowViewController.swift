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
    }
}

