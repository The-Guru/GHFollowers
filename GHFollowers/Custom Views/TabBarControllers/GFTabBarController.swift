//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by iMac Óscar on 15/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

class GFTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    UITabBar.appearance().tintColor = .systemGreen
    viewControllers                 = [createSearchNC(), createFavoritesNC()]
  }
  

  func createSearchNC() -> UINavigationController {
    let searchVC        = SearchVC()
    searchVC.title      = "Search"
    searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
    
    return UINavigationController(rootViewController: searchVC)
  }
  

  func createFavoritesNC() -> UINavigationController {
    let favoritesListVC        = FavoritesListVC()
    favoritesListVC.title      = "Favorites"
    favoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    
    return UINavigationController(rootViewController: favoritesListVC)
  }
}
