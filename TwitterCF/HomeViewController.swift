//
//  ViewController.swift
//  TwitterCF
//
//  Created by Lindsey on 10/26/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//


// test 

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var tweets = [Tweet] ()
    
    class func identifier() -> String {
        return"HomeViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.getAccount()
      
    }

    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 10
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let customTweetCellXib = UINib(nibName: "CustomTweetCell", bundle: nil)
        self.tableView.registerNib(customTweetCellXib, forCellReuseIdentifier: CustomTweetCell.identifier())
    }
    
    func getAccount() {
        LoginService.loginTwitter({ (error, account) -> () in
            if let error = error{
                print(error)
                return
            }
            
            if let account = account {
                TwitterService.sharedService.account = account
                self.authenticateUser()
            }
        })
    }
    
    func authenticateUser(){
        TwitterService.getAuthUser { (error, user) -> () in
            if let error = error {
                print(error)
                return
            }
            
            if let user = user {
                TwitterService.sharedService.user = user
                self.getTweets()
            }
        }
    }

    func getTweets() {
        TwitterService.tweetsFromHomeTimeline {(error, tweets) -> () in
            if let error = error {
                print(error)
                return
            }
            
            if let tweets = tweets{
                NSOperationQueue.mainQueue().addOperationWithBlock ({ () -> Void in
                    self.tweets = tweets
                    self.tableView.reloadData()
                })
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == TweetDetailViewController.identifier(){
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let tweet = self.tweets[indexPath.row]
                let tweetDetailViewContorller = segue.destinationViewController as! TweetDetailViewController
                tweetDetailViewContorller.tweet = tweet
            }
        }
    }
    
//Mark: UITableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomTweetCell.identifier(), forIndexPath: indexPath) as! CustomTweetCell
      
        cell.imgView.setBackgroundImage(UIImage?, forState: UIControlState.Normal)
       cell.tweet = tweets[indexPath.row]
        
        return cell
    }
}

