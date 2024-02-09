//
//  BeerViewController.swift
//  BeerList
//
//  Created by Marília de Sousa on 30/01/24.
//

import UIKit

class BeerViewController: UIViewController, UITableViewDataSource {
    
    let beerView = BeerView()
    let beerController = BeerController()
    var filteredBeer: [Beer] = []
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return (searchController.isActive && !isSearchBarEmpty) || beerView.toggle.isOn
    }
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "search"
        return searchController
    }()
    
    override func loadView() {
        self.view = beerView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        beerView.loading()
        
        self.title = "Beers List"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        beerView.beerTableView.delegate = self
        beerView.beerTableView.dataSource = self
        beerView.toggle.addTarget(self, action: #selector(toggleClick), for: .touchUpInside)
        beerController.delegate = self
        self.navigationItem.searchController = self.searchController
        Task.init{
            await beerController.getBeers()
        }
    }
    
    @objc func toggleClick() {
        filteredBeer = beerController.beers.filter {$0.isFavorite}
        beerView.beerTableView.reloadData()
    }
}

extension BeerViewController: ViewDelegate {
    func reloadView() {
        beerView.loaded()
        beerView.beerTableView.reloadData()
    }
}

extension BeerViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredBeer.count
        }
        return beerController.beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier, for: indexPath) as? BeerTableViewCell else {return UITableViewCell()}
        cell.link = self
        
        var beer: Beer
        if isFiltering {
            beer = filteredBeer[indexPath.row]
        } else {
            beer = beerController.beers[indexPath.row]
        }
        cell.accessoryType = .disclosureIndicator
        cell.beerName.text = beer.name
        cell.beerTagline.text = beer.tagline
        cell.beerImage.image = UIImage(data: beer.imageData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var beer: Beer
        if isFiltering {
            beer = filteredBeer[indexPath.row]
        } else {
            beer = beerController.beers[indexPath.row]
        }
        
        self.navigationController?.pushViewController(BeerDetailsViewController(beer: beer), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension BeerViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let text = searchBar.text else { return }
        filteredBeer = beerController.beers.filter({ beer in return beer.name.lowercased().starts(with: text.lowercased())
        })
        if(filteredBeer.count == 0){
            beerView.noResultSearch()
        } else {
            beerView.loaded()
            beerView.beerTableView.reloadData()
        }
    }
}

extension BeerViewController: UISearchBarDelegate {
    
}
