//
//  UserTimelineViewController.swift
//  TwitterCF
//
//  Created by Lindsey on 11/1/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import UIKit

class UserTimelineViewController:  UIViewController, UITableViewDelegate//, UITableViewDataSource

{

    @IBOutlet weak var userTimelineTableView: UITableView!
    
    var userTimelines = [UserTimeline] ()
    
    class func identifier() -> String {
        return"UserTimeLine"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    func setupTableView(){
        self.userTimelineTableView.delegate = self
        //self.userTimelineTableView.dataSource = self
        
        self.userTimelineTableView.estimatedRowHeight = 10
        self.userTimelineTableView.rowHeight = UITableViewAutomaticDimension
        
        let customTweetCellXib = UINib(nibName: "CustomTweetCell", bundle: nil)
        self.userTimelineTableView.registerNib(customTweetCellXib, forCellReuseIdentifier: CustomTweetCell.identifier())
    
    
        func getUserTimeLine() {
            TwitterService.tweetsFromUserTimeline {(error, tweets) -> () in
                if let error = error {
                    print(error)
                    return
                }
                
                if let userTimelines = userTimelines{
                    NSOperationQueue.mainQueue().addOperationWithBlock ({ () -> Void in
                        self.userTimelines = userTimelines
                        self.userTimelineTableView.reloadData()
                    })
                }
            }
        }
        
        
        //Mark: UITableView
    
    func userTimelineTableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTimelines.count
    }
     func numberOfSectionsInTableView(tableView: UITableView) -> Int{
            return 2
        }
     
//     func userTimelineTableViewHeader(tableView: UITableView,titleForHeaderInSection section: Int) -> UIView?{
//        }
    
    func userTimelineTableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomTweetCell.identifier(), forIndexPath: indexPath) as! CustomTweetCell
        
        cell.tweet = userTimelines[indexPath.row]
        
        return cell
        }
    }
}


    
//    //Mark: UITableView
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tweets.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier(CustomTweetCell.identifier(), forIndexPath: indexPath) as! CustomTweetCell
//        
//        cell.tweet = tweets[indexPath.row]
//        
//        return cell
//    }
//}

