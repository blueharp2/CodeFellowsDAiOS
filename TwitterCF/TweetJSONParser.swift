//
//  TweetJSONParser.swift
//  TwitterCF
//
//  Created by Lindsey on 10/26/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import Foundation

class TweetJSONParser {
    
    class func TweetFromJSONData(jsonData: NSData) -> [Tweet]? {
        do{
            if let rootObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? [[String: AnyObject]] {
                var tweets = [Tweet] ()
                for tweetObject in rootObject {
                    if let text = tweetObject ["text"] as? String, id = tweetObject["id_str"] as? String,
                        user = tweetObject ["user"] as? [String : AnyObject],
                        userName = user["name"] as? String, profileImage = user["profile_image_url"] as? String {
                        
                        
                        let tweet = Tweet(text : text, id : id, user : User(userName: userName, profileImage: profileImage))
                        tweets.append(tweet)
                    }
                }
                return tweets
            }
        } catch _ {
            return nil
            
        }
        return nil
    }
    
    class func userFromData(user : [String : AnyObject]) -> User? {
        if let userName = user["name"] as? String,
            profileImage = user["profile_image_url"] as? String {
                return User(userName: userName, profileImage: profileImage)
        }
        return nil
    }
}

