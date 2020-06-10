//
//  User.swift
//  GHFollowers
//
//  Created by iMac Óscar on 09/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import Foundation

struct User: Codable {
 let login: String
 let avatarUrl: String
 let name: String?
 let location: String?
 let bio: String?
 let publicRepos: Int
 let publicGists: Int
 let htmlUrl: String
 let following: Int
 let followers: Int
 let createdAt: String
}