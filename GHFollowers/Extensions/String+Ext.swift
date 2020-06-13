//
//  String+Ext.swift
//  GHFollowers
//
//  Created by iMac Óscar on 13/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import Foundation

extension String {
  
  func convertToDate() -> Date? {
    let dateFormatter        = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    dateFormatter.locale     = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone   = .current
    
    return dateFormatter.date(from: self)
  }
  
  func convertToDisplayFormat() -> String {
    guard let date = self.convertToDate() else { return "N/A" }
    return date.convertToMonthYearFormat()
  }
}
