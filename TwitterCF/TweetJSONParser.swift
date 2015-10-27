//
//  TweetJSONParser.swift
//  TwitterCF
//
//  Created by Lindsey on 10/26/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import Foundation

class TweetJSONParser {
    class func tweetFromJSONData(json: NSData) -> [Tweet]?{
        do{
            
            var tweets = [Tweet]()
            
            if let rootObject = try NSJSONSerialization.JSONObjectWithData(json, options: NSJSONReadingOptions.MutableContainers) as? [[String : AnyObject]]{
                
                for tweetObject in rootObject {
                    if let userDictionary = tweetObject["user"] as? [String : AnyObject],
                        let text = tweetObject["text"] as? String,
                        let id = tweetObject["id_str"] as? String,
                        let userName = userDictionary["name"] as? String,
                        let profileImage = userDictionary["profile_image_url"] as? String {
                            
                            let tweet = Tweet (text: text, id: id, userName: userName, profileImage: profileImage)
                            tweets.append(tweet)
                    }
                }
            }
            return tweets
        } catch _ {
            return nil
        }
    }
}

