//
//  BeerTableViewController.swift
//  BeerList
//
//  Created by Marília de Sousa on 30/01/24.
//

import Foundation
import UIKit

class BeerTableViewCell: UITableViewCell {
    
    static let identifier = "BeerTableViewCell"
    
    let beerName: UILabel = {
        let beerName = UILabel()
        beerName.tintColor = .black
        beerName.font = UIFont.boldSystemFont(ofSize: 16)
        beerName.numberOfLines = 0
        beerName.translatesAutoresizingMaskIntoConstraints = false
        return beerName
    }()
    
    let beerImage: UIImageView = {
        let beerImage = UIImageView()
        beerImage.contentMode = .scaleAspectFit
        beerImage.translatesAutoresizingMaskIntoConstraints = false
        return beerImage
    }()
    
    let beerTagline: UILabel = {
        let beerTagline = UILabel()
        beerTagline.textColor = .gray
        beerTagline.font = UIFont.systemFont(ofSize: 16)
        beerTagline.numberOfLines = 0
        beerTagline.translatesAutoresizingMaskIntoConstraints = false
        return beerTagline
    }()
    
    let favorite: UIButton = {
        let favorite = UIButton()
        favorite.imageView?.image = UIImage(systemName: "heart")
        return favorite
    }()
    
    var link: BeerViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(beerName)
        self.contentView.addSubview(beerImage)
        self.contentView.addSubview(beerTagline)
        self.contentView.addSubview(favorite)
        
        loadConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadConstraints() {
        
        let beerTableViewConstraints = [
            beerImage.widthAnchor.constraint(equalToConstant: 60),
            beerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            beerImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            beerImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            
            beerName.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 10),
            beerName.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            beerName.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            beerName.topAnchor.constraint(equalTo: self.topAnchor, constant: -40),
            
            beerTagline.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 10),
            beerTagline.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            beerTagline.bottomAnchor.constraint(equalTo: beerName.bottomAnchor, constant: 70),
            beerTagline.topAnchor.constraint(equalTo: beerName.topAnchor, constant: 10),
        ]
        
        NSLayoutConstraint.activate(beerTableViewConstraints)
    }
}

