//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by iMac Óscar on 12/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureItems()
  }
  
  private func configureItems() {
    itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
    itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
    actionButon.set(backgroundColor: .systemPurple, title: "GitHub Profile")
  }
  
  override func actionButtonTaped() {
    delegate.didTapGitHubProfile(for: user)
  }
}
