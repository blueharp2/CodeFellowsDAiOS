//
//  UserTimeline.swift
//  TwitterCF
//
//  Created by Lindsey on 11/1/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import Foundation

class UserTimeline {
    let screenName: String
    let location: String
    let profileImage: String
    let profileBackgroundImage: String
    let status: String
    let text: String
    
    init(screenName: String, location: String, profileImage: String, profileBackgroundImage: String, status: String, text: String){
        self.screenName = screenName
        self.location = location
        self.profileImage = profileImage
        self.profileBackgroundImage = profileBackgroundImage
        self.status = status
        self.text = text
    }
    
    
}

