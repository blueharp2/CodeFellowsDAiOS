//
//  TweetDetailViewController.swift
//  TwitterCF
//
//  Created by Lindsey on 10/29/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
  
    @IBAction func imgButton(sender: UIButton) {
       
        
    }
    
    
    // Class Properties
    var tweet : Tweet!
    
    class func identifier() -> String {
        return "TweetDetailViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppeaance()
        self.setupTweetDetailViewController()
        
        //self.imgView.setBackgroundImage(image: UIImage?, forState: UIControlState)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupAppeaance() {
        if let tweet = self.tweet{
            if let retweetStatus = tweet.retweetStatus {
                self.userNameLabel.text = retweetStatus.user?.userName
                self.tweetLabel.text = retweetStatus.text
                self.navigationItem.title = retweetStatus.user?.userName
                self.imageView.image = self.tweet.user?.image
            } else {
                self.tweetLabel.text = tweet.text
                self.userNameLabel.text = tweet.user?.userName
                self.navigationItem.title = tweet.user?.userName
                self.imageView.image = self.tweet.user?.image
            }
            
        }
    }
    
    func setupTweetDetailViewController() {
        self.tweetLabel.text = self.tweet.isRetweet ?
            self.tweet.rtText : self.tweet.text
    }



    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == UserTimelineTableViewController.identifier(){
            
            let userTimeLineDetailViewController = segue.destinationViewController as! UserTimelineTableViewController
        
//            if let indexPath = self.tableView.indexPathForSelectedRow{
//                let tweet = self.tweets[indexPath.row]
//                let tweetDetailViewContorller = segue.destinationViewController as! TweetDetailViewController
//                tweetDetailViewContorller.tweet = tweet
//            }
        }
    }
}
    

