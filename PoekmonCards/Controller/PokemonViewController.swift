//
//  ViewController.swift
//  PoekmonCards
//
//  Created by Inga Kirsona on 15/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var pokey: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokemon List"
//-------> the same as to connect with control+view controller and choose dataSource, delegate
        tableView.dataSource = self
    }
    
    func getPokemon(){
        let url = URL(string: "https://api.pokemontcg.io/v1/cards")!
        
        NetworkController.performRequest(for: url, httpMethod: .Get){
            (data, error) in
            if let error = error{
                print("error getting from url \(url.absoluteString), err: \(error.localizedDescription)")
            }
            if let data = data{
                do{
                let card = try JSONDecoder().decode(Card.self, from: data)
                    self.pokey = card.cards
                }catch{
                    print ("failed to decode pokemon from pokey data \(error.localizedDescription). Data \(data)")
                }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    

extension PokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeyCell", for: indexPath)
        
        return cell
    }
    
    
}
