//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by iMac Óscar on 09/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
  
  var username: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
    
    NetworkManager.shared.getFollowers(for: username, page: 1) { result in
      
      switch result {
      case .success(let followers):
        print("Followers.count = \(followers.count)")
        print(followers)
        
      case .failure(let error):
        self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
        DispatchQueue.main.async {
          self.navigationController?.popViewController(animated: true)
        }
      }
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
}
