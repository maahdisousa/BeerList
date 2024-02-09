//
//  BeerService.swift
//  BeerList
//
//  Created by Marília de Sousa on 30/01/24.
//

import Foundation

class BeerService {
    
    private let imageCache = NSCache <NSString, NSData>()
    
    func getAllBeer() async throws -> [BeerModel] {
        do {
            let (dataRequest, _) = try await URLSession.shared.data(from: URL(string: Constants.baseURL)!)
            let result = try JSONDecoder().decode([BeerModel].self, from: dataRequest)
            return result
        } catch {
            throw error
        }
    }
    
    func getImageBeer(imageUrl: String) async throws -> Data {
        
        if let imageDataFromCache = imageCache.object(forKey: imageUrl as NSString) as? Data {
            return imageDataFromCache
        }
        do {
            let (imageData, _) = try await URLSession.shared.data(from: URL(string: imageUrl)!)
            imageCache.setObject(imageData as NSData, forKey: imageUrl as NSString)
            return imageData
        } catch {
            throw error
        }
    }
}
