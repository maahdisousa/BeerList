//
//  BeerController.swift
//  BeerList
//
//  Created by Marília de Sousa on 30/01/24.
//

import Foundation

protocol ViewDelegate: AnyObject {
    func reloadView()
}
class BeerController {
    private let beerService: BeerService
    var beers: [Beer] = []
    weak var delegate: ViewDelegate?
    
    init(beerService: BeerService = BeerService()) {
        self.beerService = beerService
        
    }
    func getBeers() async {
        do {
            let beers = try await beerService.getAllBeer()
            for beer in beers {
                let imageData = try await beerService.getImageBeer(imageUrl: beer.image)
                self.beers.append(Beer(id: beer.id, name: beer.name, tagline: beer.tagline, description: beer.description, imageData: imageData))
                
            }
            DispatchQueue.main.async {
                self.delegate?.reloadView()
            }
        } catch {
            
        }
    }
}
