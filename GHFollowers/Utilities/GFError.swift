//
//  GFError.swift
//  GHFollowers
//
//  Created by iMac Óscar on 11/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import Foundation

enum GFError: String, Error {
  case invalidUsername  = "This username created an invalid request. Please try again."
  case unableToComplete = "Unable to complete your request. Please check your Internet connection."
  case invalidResponse  = "Invalid response from the server. Please try again."
  case invalidData      =  "The data received from the server was invalid. Please try again."
}
