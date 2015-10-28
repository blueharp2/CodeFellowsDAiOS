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
    }

//    func getTweets(){
//        if let tweetJSONFlieUrl = NSBundle.mainBundle().URLForResource("tweet", withExtension: "json") {
//            if let tweetJSONData = NSData(contentsOfURL: tweetJSONFlieUrl){
//                if let tweets = TweetJSONParser.TweetFromJSONData(tweetJSONData){
//                self.tweets = tweets
//                self.tableView.reloadData()
//                }
//            }
//        }
//    }
    
    
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

