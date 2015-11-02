//
//  TwitterService.swift
//  TwitterCF
//
//  Created by Lindsey on 10/28/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import Foundation
import Accounts
import Social

class TwitterService {
    static let sharedService = TwitterService()
    
    var account: ACAccount?
    var user : User?
    var userTimeline: UserTimeline?
    
    class func tweetsFromHomeTimeline(completion: (String?, [Tweet]?) -> () ) {
        
        let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: NSURL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json"), parameters: nil)
        
        if let account = self.sharedService.account {
            request.account = account
            
            request.performRequestWithHandler { (data, response, error) -> Void in
                if let error = error {
                    print(error.description)
                    completion("ERROR: SLRequest type GET for /1.1/statuses/home_timeline.json could not be completed.", nil); return
                }
                print(response.description)
                
                switch response.statusCode {
                case 200...299:
                    let tweets = TweetJSONParser.TweetFromJSONData(data)
                    completion(nil, tweets)
                default:
                    completion("ERROR: SLRequest type GET for /1.1/statuses/home_timeline.json returned status code \(response.statusCode) [unknown error].", nil)
                }
            }
        }
    }
    class func getAuthUser(completion:(String?, User?) -> ()) {
        let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: NSURL(string: "https://api.twitter.com/1.1/account/verify_credentials.json"), parameters: nil)
        
        if let account = self.sharedService.account {
            request.account = account
            
            request.performRequestWithHandler { (data, response, error) -> Void in
                
                if let error = error {
                    print(error)
                    completion("ERROR: SLR SLRequest type GET for /1.1/account/verify_credentials.json could not be completed.", nil); return
                }
                
                switch response.statusCode {
                case 200...299:
                    do{
                        if let userData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String :  AnyObject] {
                            if let user = TweetJSONParser.userFromData(userData){
                                completion(nil, user); return
                            }
                            completion("ERROR: unable to create user object from de-serialized JSON object.", nil)
                            }
                        } catch {
                            completion("ERROR: NSJSONSerialization.JSONObjectWithData was unable to de-serialize JSON object.", nil)
                        }
                default:
                        completion("ERROR: SLRequest type GET for /1.1/account/verify_credentials.json returned status code \(response.statusCode) [unknown error].", nil)
                }
            }
        }
    }
    
//    class func tweetsFromUserTimeline(completion: (String?, [UserTimeline]?) -> () ) {
//        
//        let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: NSURL(string: "https://https://api.twitter.com/1.1/users/lookup.json"), parameters: nil)
//        
//        if let account = self.sharedService.account {
//            request.account = account
//            
//            request.performRequestWithHandler { (data, response, error) -> Void in
//                if let error = error {
//                    print(error.description)
//                    completion("ERROR: SLRequest type GET for 1.1/users/lookup.json could not be completed", nil); return
//                }
//                print(response.description)
//                
//                switch response.statusCode {
//                case 200...299:
//                    let tweets = TweetJSONParser.TweetFromJSONData(data)
//                    completion(nil, userTimeline)
//                default:
//                    completion("ERROR: SLRequest type GET for 1.1/users/lookup.json returned status code \(response.statusCode) [unknown error].", nil)
//                }
//            }
//        }
//    }

}

