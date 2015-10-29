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
        //self.getTweets()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TweetDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let tweet = self.tweets[indexPath.row]
                let tweetDetailViewContorller = segue.destinationViewController as! TweetDetailViewController
                tweetDetailViewContorller.tweet = tweet
            }
        }
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
    

    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 10
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
//Mark: UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath)
        
        let tweet = self.tweets[indexPath.row]
        cell.textLabel?.text = tweet.text
        cell.detailTextLabel?.text = "Tweet id is: \(tweet.id)"
        
        return cell
        
    }
}

