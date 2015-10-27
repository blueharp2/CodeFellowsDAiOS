//
//  ViewController.swift
//  TwitterCF
//
//  Created by Lindsey on 10/26/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

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
        self.getTweets()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func getTweets(){
        if let tweetJSONFlieUrl = NSBundle.mainBundle().URLForResource("tweet", withExtension: "json") {
            if let tweetJSONData = NSData(contentsOfURL: tweetJSONFlieUrl){
                if let tweets = TweetJSONParser.tweetFromJSONData(tweetJSONData){
                self.tweets = tweets
                self.tableView.reloadData()
                }
            }
        }
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

