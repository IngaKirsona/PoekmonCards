//
//  ImageController.swift
//  PoekmonCards
//
//  Created by Inga Kirsona on 15/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit
class ImageController {
    static func getImage(for url: String, completion: @escaping (UIImage?) -> Void){
        //-------> to check if url is a String
        guard let imageURL = URL(string: url) else{
            fatalError("Could not create url from string: \(url)")
        }
        NetworkController.performRequest(for: imageURL, httpMethod: .Get) {
            (data, error) in
            guard let data = data, let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
