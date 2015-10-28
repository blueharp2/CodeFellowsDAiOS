//
//  User.swift
//  TwitterCF
//
//  Created by Lindsey on 10/28/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import Foundation

class User {
    let userName: String
    let profileImage: String
    
    init(userName: String, profileImage: String){
        self.userName = userName
        self.profileImage = profileImage
    }
}