//
//  TabBarController.swift
//  TappyTips
//
//  Created by Daniel Shiferaw on 4/23/18.
//  Copyright © 2018 Daniel Shiferaw. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
         setupTabs()
    }
    func setupTabs() {
        
        //tabs
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let searchController = SearchController()
        let cameraController = CameraController()
        let categoriesController = CategoriesController()
        let mostPopularController = MostPopularController()
        
        homeController.tabBarItem = UITabBarItem(title: "home", image: #imageLiteral(resourceName: "icons8-home-50") , tag: 0)
        searchController.tabBarItem = UITabBarItem(title: "search", image: #imageLiteral(resourceName: "icons8-search-filled-50"), tag: 1)
        cameraController.tabBarItem = UITabBarItem(title: "post", image: #imageLiteral(resourceName: "icons8-screenshot-50") , tag: 2)
        mostPopularController.tabBarItem = UITabBarItem(title: "popular", image: #imageLiteral(resourceName: "icons8-popular-filled-50"), tag: 3)
        categoriesController.tabBarItem = UITabBarItem(title: "categories", image: #imageLiteral(resourceName: "icons8-categorize-50"), tag: 4)
        
        //set view controllers
        self.setViewControllers([homeController, searchController,cameraController, mostPopularController, categoriesController], animated: true)

    }
}
