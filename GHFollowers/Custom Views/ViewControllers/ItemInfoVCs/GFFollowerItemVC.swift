//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by iMac Óscar on 12/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

protocol GFFollowerItemVCDelegate: class {
  func didTapGetFollowers(for user: User)
}

class GFFollowerItemVC: GFItemInfoVC {
  
  weak var delegate: GFFollowerItemVCDelegate!
  
  init(user: User, delegate: GFFollowerItemVCDelegate) {
    super.init(user: user)
    self.delegate = delegate
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureItems()
  }
  
  private func configureItems() {
    itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
    itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
    actionButon.set(backgroundColor: .systemGreen, title: "Get Followers")
  }
  
  override func actionButtonTaped() {
    delegate.didTapGetFollowers(for: user)
  }
}
