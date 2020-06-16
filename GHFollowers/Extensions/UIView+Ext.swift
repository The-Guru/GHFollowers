//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by iMac Óscar on 15/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

extension UIView {
  
  func addSubviews(_ views: UIView...) {
    for view in views { addSubview(view) }
  }
}
