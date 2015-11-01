//
//  UserTimelineJSONParser.swift
//  TwitterCF
//
//  Created by Lindsey on 11/1/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import Foundation

class UserTimelineJSONParser {
    class func TweetFromJSONData(jsonData: NSData) -> [UserTimeline]? {
        do{
            if let rootObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? [[String: AnyObject]] {
                
                var userTimeline = [UserTimeline] ()
                
                for userObject in rootObject {
                    
                    if let screenName = userObject ["screen_name"] as? String,
                            location = userObject["location"] as? String,
                        profileImage = userObject["profile_image_url"] as? String,
                        profileBackgroundImage = userObject["profile_background_image_url"] as? String?
                    
                            status = userObject ["status"] as? [String : AnyObject] {
                                    if let text = status["text"] as? String
                                }
                            }
                            
                let userTimeline = UserTimeline(screenName : screenName, location : location, profileImage: profileImage, profileBackgroundImage : profileBackgroundImage, status : status)
                    userTimeline.append(userTimeline)
                    }
                return userTimeline
                }
            } catch _ {
                return nil
            }
        return nil
    }

//
//    class TweetJSONParser {
//        class func TweetFromJSONData(jsonData: NSData) -> [Tweet]? {
//            do{
//                if let rootObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? [[String: AnyObject]] {
//                    
//                    var tweets = [Tweet] ()
//                    
//                    for tweetObject in rootObject {
//                        
//                        if let text = tweetObject ["text"] as? String, id = tweetObject["id_str"] as? String,
//                            user = tweetObject ["user"] as? [String : AnyObject] {
//                                var retweetStatus:Tweet?
//                                
//                                let isRetweet = self.isRetweet(tweetObject)
//                                if isRetweet.0 == true {
//                                    if let retweetObject = isRetweet.1 {
//                                        if let text = retweetObject["text"] as? String,
//                                            id = retweetObject["id_str"] as? String,
//                                            user = retweetObject["user"] as? [String: AnyObject],
//                                            username = user["name"] as? String,
//                                            profileImage = user["profile_image_url"] as? String {
//                                                retweetStatus = Tweet(text: text, id: id)
//                                                retweetStatus!.user = User(userName: username, profileImage: profileImage)
//                                        }
//                                    }
//                                }
//                                
//                                let tweet = Tweet(text : text, id : id)
//                                if let name = user["name"] as? String, profileImage = user["profile_image_url"] as? String {
//                                    tweet.user = User(userName : name , profileImage: profileImage)
//                                    tweet.retweetStatus = retweetStatus                                }
//                                tweets.append(tweet)
//                        }
//                    }
//                    return tweets
//                }
//            } catch _ {
//                return nil
//            }
//            return nil
//}
