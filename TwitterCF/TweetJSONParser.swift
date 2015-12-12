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
                        user = tweetObject ["user"] as? [String : AnyObject] {
                            var retweetStatus:Tweet?
                            
                            let isRetweet = self.isRetweet(tweetObject)
                            if isRetweet.0 == true {
                                if let retweetObject = isRetweet.1 {
                                    if let text = retweetObject["text"] as? String,
                                        id = retweetObject["id_str"] as? String,
                                        user = retweetObject["user"] as? [String: AnyObject],
                                        username = user["name"] as? String,
                                        profileImage = user["profile_image_url"] as? String {
                                            retweetStatus = Tweet(text: text, id: id)
                                            retweetStatus!.user = User(userName: username, profileImage: profileImage)
                                    }
                                }
                            }
                            
                            let tweet = Tweet(text : text, id : id)
                            if let name = user["name"] as? String, profileImage = user["profile_image_url"] as? String {
                                tweet.user = User(userName : name , profileImage: profileImage)
                                tweet.retweetStatus = retweetStatus
                            }
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
    
    class func isRetweet(tweetObject: [String : AnyObject]) -> (Bool, [String : AnyObject]?){
        if let retweetObject = tweetObject["retweeted_status"] as? [String : AnyObject]{
            
            if let user = retweetObject["user"] as? [String: AnyObject], name = user["name"] as? String {
                print("original tweeter: \(name)")
            }
            if let _ = retweetObject ["text"] as? String, _ = retweetObject["user"] as? [String : AnyObject]{
                return (true, retweetObject)
            }
        }
        return (false, nil)
    }
    
    class func isQuote(tweetObject: [String: AnyObject]) -> Bool {
        if let quoteStatus = tweetObject["is_quote_status"] as? Bool where quoteStatus == true {
            if let quoteData = tweetObject["quoted_status"] as? [String : AnyObject] {
                if let _ = quoteData ["text"] as? String, _ = quoteData["user"] as? [String : AnyObject] {
                    return true
                }
            }
        }
        return false
    }
    
    class func userFromData(user: [String : AnyObject]) -> User? {
        if let name = user["name"] as? String, profileImage = user["profile_image_url"] as? String {
            return User(userName: name, profileImage: profileImage)
        }
        return nil
    }
}
//
//    class func userFromData(user : [String : AnyObject]) -> Bool {
//        if let quoteStatus = tweetObject["is_quote_status"] as? Bool where quoteStatus == true {
//            if let quoteData = tweetObject[ "quoteStatus"] as? [String: AnyObject] {
//                if let _ = quoteData ["text"] as? String, _ = quoteData["user"] as? [String:AnyObject] {
//                    return true
//                }
//            }
//        }
//        return false
//    }
//    class func userFromData(user : [String: AnyObject]) ->User? {
//        if let userName = user["name"] as? String,
//            profileImage = user["profile_image_url"] as? String {
//                return User(userName: userName, profileImage: profileImage)
//        }
//        return nil
//    }
//}



//
//
//
//    class func TweetFromJSONData(jsonData: NSData) -> [Tweet]? {
//        do{
//            if let rootObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? [[String: AnyObject]] {
//                var tweets = [Tweet] ()
//                for tweetObject in rootObject {
//                    if let text = tweetObject ["text"] as? String, id = tweetObject["id_str"] as? String,
//                        user = tweetObject ["user"] as? [String : AnyObject]
//                        userName = user["name"] as? String, profileImage = user["profile_image_url"] as? String {
//
//
//                        let tweet = Tweet(text : text, id : id, user : User(userName: userName, profileImage: profileImage))
//                        tweets.append(tweet)
//                    }
//                }
//                return tweets
//            }
//        } catch _ {
//            return nil
//
//        }
//        return nil
//    }
//
//    class func userFromData(user : [String : AnyObject]) -> User? {
//        if let userName = user["name"] as? String,
//            profileImage = user["profile_image_url"] as? String {
//                return User(userName: userName, profileImage: profileImage)
//        }
//        return nil
//    }
//}
//
