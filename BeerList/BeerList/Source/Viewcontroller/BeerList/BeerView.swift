//
//  BeerView.swift
//  BeerList
//
//  Created by Marília de Sousa on 30/01/24.
//

import Foundation
import UIKit

class BeerView: UIView {
    
    let loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView(style: .medium)
        loadingIndicator.startAnimating()
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        return loadingIndicator
    }()
    
    let noResultImage: UIImageView = {
        let noResultImage = UIImageView()
        noResultImage.image = UIImage(named: "noResult")
        noResultImage.contentMode = .scaleAspectFit
        noResultImage.translatesAutoresizingMaskIntoConstraints = false
        return noResultImage
    }()
    
    let noResultLabel: UILabel = {
        let noResultLabel = UILabel()
        noResultLabel.text = "No results were found"
        noResultLabel.tintColor = .black
        noResultLabel.font = UIFont.boldSystemFont(ofSize: 20)
        noResultLabel.translatesAutoresizingMaskIntoConstraints = false
        return noResultLabel
    }()
    
    let noResultView: UIView = {
        let noResultView = UIView()
        noResultView.translatesAutoresizingMaskIntoConstraints = false
        return noResultView
    }()
    
    let toggleTitle: UILabel = {
        let toggleTitle = UILabel()
        toggleTitle.text = "Favorites Only"
        toggleTitle.tintColor = .black
        toggleTitle.font = UIFont.boldSystemFont(ofSize: 14)
        toggleTitle.translatesAutoresizingMaskIntoConstraints = false
        return toggleTitle
    }()
    
    let toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.onTintColor = .black
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    let toggleStack: UIStackView = {
        let toggleStack = UIStackView()
        toggleStack.axis = .horizontal
        toggleStack.distribution = .equalSpacing
        toggleStack.backgroundColor = .blue
        toggleStack.translatesAutoresizingMaskIntoConstraints = false
        return toggleStack
    }()
    
    let beerTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(BeerTableViewCell.self, forCellReuseIdentifier: BeerTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        self.addSubview(toggleTitle)
        self.addSubview(toggle)
        self.addSubview(beerTableView)
        self.addSubview(loadingIndicator)
        self.addSubview(noResultView)
        self.noResultView.addSubview(noResultLabel)
        self.noResultView.addSubview(noResultImage)
        
        loadConstraints()
    }
    
    required init?(coder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadConstraints() {
        
        let loadingIndicatorConstraints = [
            loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        
        let toggleConstraints = [
            toggle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            toggle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        ]
        
        let toggleTitleConstraints = [
            toggleTitle.trailingAnchor.constraint(equalTo: self.toggle.leadingAnchor, constant: -20),
            toggleTitle.centerYAnchor.constraint(equalTo: self.toggle.centerYAnchor)
        ]
        
        let beerTableViewConstraints = [
            beerTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            beerTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            beerTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            beerTableView.topAnchor.constraint(equalTo: toggle.bottomAnchor, constant: 10)
        ]
        
        let noResultViewConstraints = [
            noResultView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            noResultView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        
        let noResultImageConstraints = [
            noResultImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            noResultImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        
        let noResultLabelConstraints = [
            noResultLabel.topAnchor.constraint(equalTo: self.noResultImage.bottomAnchor, constant: 30),
            noResultLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -95 )
        ]
        
        NSLayoutConstraint.activate(beerTableViewConstraints)
        NSLayoutConstraint.activate(toggleTitleConstraints)
        NSLayoutConstraint.activate(toggleConstraints)
        NSLayoutConstraint.activate(loadingIndicatorConstraints)
        NSLayoutConstraint.activate(noResultViewConstraints)
        NSLayoutConstraint.activate(noResultImageConstraints)
        NSLayoutConstraint.activate(noResultLabelConstraints)
    }
    
    func loading() {
        beerTableView.isHidden = true
        noResultView.isHidden = true
    }
    
    func loaded() {
        beerTableView.isHidden = false
        loadingIndicator.isHidden = true
        noResultView.isHidden = true
    }
    
    func noResultSearch() {
        beerTableView.isHidden = true
        loadingIndicator.isHidden = true
        noResultView.isHidden = false
    }
}
