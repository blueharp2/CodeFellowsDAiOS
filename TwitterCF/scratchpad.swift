//
//  scratchpad.swift
//  TwitterCF
//
//  Created by Lindsey on 10/30/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import Foundation


// ---------------- tweet json parser tweets from json .... retweet parse 

//                                  if let retweetText = retweetObject["text"] as? String, retweetUser = retweetObject["user"] as? [String: AnyObject]{
//                                        if let retweetUser = userFromData(retweetUser), user = userFromData(user) {
//                                            let tweet = Tweet(text: text, id: id, user: user, rtUser: retweetUser, rtText: retweetText, isRetweet: true)
//                                            tweets.append(tweet)
//                                        }
//                                    }
//





//Original segue and TableView Protocols before we used a Xib for the cell
//override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    if segue.identifier == "TweetDetail" {
//        if let indexPath = self.tableView.indexPathForSelectedRow{
//            let tweet = self.tweets[indexPath.row]
//            let tweetDetailViewContorller = segue.destinationViewController as! TweetDetailViewController
//            tweetDetailViewContorller.tweet = tweet
//        }
//    }
//}
//
////Mark: UITableView
//func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return self.tweets.count
//}
//func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath)
//    
//    let tweet = self.tweets[indexPath.row]
//    cell.textLabel?.text = tweet.text
//    cell.detailTextLabel?.text = "Tweet id is: \(tweet.id)"
//    
//    return cell
//    
//}
//}



//
//let playButton  = UIButton(type: .Custom)
//if let image = UIImage(named: "play.png") {
//    playButton.setImage(image, forState: .Normal)
//}


//func imageForState(_state: UIControlState) ->UIImage {
//    if let image{
//        return self.image
//    }
//    
//}

