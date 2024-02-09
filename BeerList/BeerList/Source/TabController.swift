//
//  TabController.swift
//  BeerList
//
//  Created by Marília de Sousa on 07/02/24.
//

import Foundation
import UIKit

class TabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }
    
    func setupTabs() {
        let search = createNavigationController(title: "Search", image: UIImage(systemName: "magnifyingglass"), viewController: BeerViewController())
        let favorites = createNavigationController(title: "Favorites", image: UIImage(systemName: "heart.fill"), viewController: BeerViewController())
        self.setViewControllers([search, favorites], animated: true)
    }
    
    func createNavigationController(title: String, image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
}
