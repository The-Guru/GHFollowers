//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by iMac Óscar on 10/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
  
  let cache            = NetworkManager.shared.cache
  let placeholderImage = Images.placeholder
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    layer.cornerRadius = 10
    clipsToBounds      = true
    image              = placeholderImage
    translatesAutoresizingMaskIntoConstraints = false
  }
}
