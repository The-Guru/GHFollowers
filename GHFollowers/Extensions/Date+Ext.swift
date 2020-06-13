//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by iMac Óscar on 13/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import Foundation

extension Date {
  
  func convertToMonthYearFormat() -> String {
    let dateFormatter        = DateFormatter()
    dateFormatter.dateFormat = "MMM yyyy"
    
    return dateFormatter.string(from: self)
  }
}
