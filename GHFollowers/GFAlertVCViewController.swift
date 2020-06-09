//
//  GFAlertVCViewController.swift
//  GHFollowers
//
//  Created by iMac Óscar on 09/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

class GFAlertVC: UIViewController {
  
  let containerView = UIView()
  let titleLabel    = GFTitleLabel(textAlignment: .center, fontSize: 20)
  let messageLabel  = GFBodyLabel(textAlignment: .center)
  let actionButton  = GFButton(backgroundColor: .systemPink, title: "Ok")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}
