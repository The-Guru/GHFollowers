//
//  GFButton.swift
//  GHFollowers
//
//  Created by iMac Óscar on 09/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

class GFButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(backgroundColor: UIColor, title: String) {
    self.init(frame: .zero)
    self.backgroundColor = backgroundColor
    self.setTitle(title, for: .normal)
  }
  
  private func configure() {
    setTitleColor(.white, for: .normal)
    layer.cornerRadius = 10
    titleLabel?.font   = UIFont.preferredFont(forTextStyle: .headline)
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  func set(backgroundColor: UIColor, title: String) {
    self.backgroundColor = backgroundColor
    setTitle(title, for: .normal)
  }
}
