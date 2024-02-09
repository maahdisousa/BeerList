//
//  BeerModel.swift
//  BeerList
//
//  Created by Marília de Sousa on 30/01/24.
//

import Foundation

struct BeerModel: Codable {
    
    let id: Int
    let name: String
    let tagline: String
    let description: String
    let image: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, tagline, description, image = "image_url"
    }
}




