//
//  Beer.swift
//  BeerList
//
//  Created by Marília de Sousa on 06/02/24.
//

import Foundation
import UIKit


class Beer  {
    let id: Int
    let name: String
    let tagline: String
    let description: String
    let imageData: Data
    var isFavorite: Bool
    
    init(id: Int, name: String, tagline: String, description: String, imageData: Data) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.description = description
        self.imageData = imageData
        self.isFavorite = false
    }
}


