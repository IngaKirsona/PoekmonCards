//
//  Pokemon.swift
//  PoekmonCards
//
//  Created by Inga Kirsona on 15/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let imageUrl: String?
    let hp: String?
    let number: String?
    let series: String?
    let pokemonSet: String?
    
    enum CodingKeys: String, CodingKey{
        case name
        case imageUrl
        case hp
        case number
        case series
        case pokemonSet = "set"
    }
}

struct Card: Decodable {
    let cards: [Pokemon]
}
