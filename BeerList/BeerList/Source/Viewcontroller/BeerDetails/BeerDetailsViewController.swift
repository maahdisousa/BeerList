//
//  BeerDetailsController.swift
//  BeerList
//
//  Created by Marília de Sousa on 30/01/24.
//

import Foundation
import UIKit

class BeerDetailsViewController: UIViewController {
    
    let beerDetailsView = BeerDetailsView()
    let beer: Beer
    
    init(beer: Beer) {
        self.beer = beer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = beerDetailsView
    }
    
    override func viewDidLoad() {
        beerDetailsView.setupBeer(beer: beer)
        self.navigationItem.title = "Beer Details"
        self.updateRigthBarButton(isFavorite: beer.isFavorite)
    }
    
    func updateRigthBarButton(isFavorite: Bool) {
        let barButtonImage = beer.isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: self, action: #selector( self.clickButton))
    }
    
    @objc func clickButton(){
        beer.isFavorite = !beer.isFavorite
        updateRigthBarButton(isFavorite: beer.isFavorite)
    }
}
