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
    var user: User?
    
    let rtText: String?
    let rtUser: User?
    
    var isRetweet: Bool
    
    init(text: String, id: String, user: User? = nil, rtText: String? = nil, rtUser: User? = nil, isRetweet: Bool = false){
        self.text = text
        self.id = id
        self.user = user
        self.rtText = rtText
        self.rtUser = rtUser
        self.isRetweet = isRetweet
        
    }
}