//
//  UserTimelineViewController.swift
//  TwitterCF
//
//  Created by Lindsey on 11/1/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import UIKit

class UserTimelineViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var userTimelines = [UserTimeline] ()
    
    class func identifier() -> String {
        return"UserTimeLine"
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
     
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 10
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let customTweetCellXib = UINib(nibName: "CustomTweetCell", bundle: nil)
        self.tableView.registerNib(customTweetCellXib, forCellReuseIdentifier: CustomTweetCell.identifier())
    
    
        func getUserTimeLine() {
            TwitterService.tweetsFromUserTimeline {(error, tweets) -> () in
                if let error = error {
                    print(error)
                    return
                }
                
                if let userTimelines = userTimelines{
                    NSOperationQueue.mainQueue().addOperationWithBlock ({ () -> Void in
                        self.userTimelines = userTimelines
                        self.tableView.reloadData()
                    })
                }
            }
        }
        
        
        //Mark: UITableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTimelines.count
    }
    optional func numberOfSectionsInTableView(tableView: UITableView) -> Int{
            return 2
        }
        
    optional func tableView(tableView: UITableView,titleForHeaderInSection section: Int) -> String?{
            
        }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomTweetCell.identifier(), forIndexPath: indexPath) as! CustomTweetCell
        
        cell.tweet = UserTimeline.status[indexPath.row]
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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

