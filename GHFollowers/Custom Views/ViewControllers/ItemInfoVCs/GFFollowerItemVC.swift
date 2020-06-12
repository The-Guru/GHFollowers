//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by iMac Óscar on 12/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureItems()
  }
  
  private func configureItems() {
    itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
    itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
    actionButon.set(backgroundColor: .systemGreen, title: "Get Followers")
  }
}
