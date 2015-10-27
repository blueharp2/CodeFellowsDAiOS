//
//  Tweet.swift
//  TwitterCF
//
//  Created by Lindsey on 10/26/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import Foundation

class Tweet{
    let text: String
    let id: String
    let userName: String
    let profileImage: String
    
    init(text: String, id: String, userName: String, profileImage: String){
        self.text = text
        self.id = id
        self.userName = userName
        self.profileImage = profileImage
    }
}