//
//  BeerDetailsView.swift
//  BeerList
//
//  Created by Marília de Sousa on 30/01/24.
//

import Foundation
import UIKit

class BeerDetailsView: UIView {
    
    let beerName: UILabel = {
        let beerName = UILabel()
        beerName.tintColor = .black
        beerName.font = UIFont.boldSystemFont(ofSize: 18)
        beerName.numberOfLines = 0
        beerName.translatesAutoresizingMaskIntoConstraints = false
        return beerName
    }()
    
    let beerTagline: UILabel = {
        let beerTagline = UILabel()
        beerTagline.tintColor = .black
        beerTagline.font = UIFont.boldSystemFont(ofSize: 18)
        beerTagline.numberOfLines = 0
        beerTagline.translatesAutoresizingMaskIntoConstraints = false
        return beerTagline
    }()
    
    let beerDescription: UILabel = {
        let beerDescription = UILabel()
        beerDescription.textColor = .gray
        beerDescription.font = UIFont.systemFont(ofSize: 18)
        beerDescription.numberOfLines = 0
        beerDescription.translatesAutoresizingMaskIntoConstraints = false
        return beerDescription
    }()
    
    let beerImage: UIImageView = {
        let beerImage = UIImageView()
        beerImage.translatesAutoresizingMaskIntoConstraints = false
        beerImage.contentMode = .scaleAspectFit
        return beerImage
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        
        self.addSubview(beerImage)
        self.addSubview(beerName)
        self.addSubview(beerTagline)
        self.addSubview(beerDescription)
        
        let safeArea = self.safeAreaLayoutGuide
        let beerImageConstraints = [
            beerImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            beerImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            beerImage.heightAnchor.constraint(equalToConstant: 74),
            beerImage.widthAnchor.constraint(equalToConstant: 74)
        ]
        
        let beerNameConstraints = [
            beerName.topAnchor.constraint(equalTo: beerImage.topAnchor),
            beerName.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 16),
            beerName.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
        ]
        
        let beerTaglineConstraints = [
            beerTagline.topAnchor.constraint(equalTo: beerName.bottomAnchor, constant: 16),
            beerTagline.leadingAnchor.constraint(equalTo: beerName.leadingAnchor),
            beerTagline.trailingAnchor.constraint(equalTo: beerName.trailingAnchor)
        ]
        
        let beerDescriptionConstraints = [
            beerDescription.topAnchor.constraint(equalTo: beerImage.bottomAnchor, constant: 32),
            beerDescription.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            beerDescription.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(beerImageConstraints)
        NSLayoutConstraint.activate(beerNameConstraints)
        NSLayoutConstraint.activate(beerTaglineConstraints)
        NSLayoutConstraint.activate(beerDescriptionConstraints)
    }
    
    func setupBeer(beer: Beer){
        beerImage.image = UIImage(data: beer.imageData)
        beerName.text = beer.name
        beerTagline.text = beer.tagline
        beerDescription.text = beer.description
    }
}
