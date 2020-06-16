//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by iMac Óscar on 16/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

extension UITableView {
  
  func reloadDataOnMainThread() {
    DispatchQueue.main.async { self.reloadData() }
  }
  

  func removeExcessCells() {
    tableFooterView = UIView(frame: .zero)
  }
}
