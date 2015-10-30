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
    
    

    // Class Properties
    var tweet : Tweet!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppeaance()
        self.setupTweetDetailViewController()
        
        
        
        if let tweet = self.tweet{
            print(tweet.text)
            self.tweetLabel.text = tweet.text
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupAppeaance() {
        if self.tweet.isRetweet {
            if let rtUser = self.tweet.user {
                self.navigationItem.title = "\(rtUser)"
                return
            }
        }
        if let name = tweet.user?.userName {
            self.navigationItem.title = name
        }
    }
    
    func setupTweetDetailViewController() {
        self.tweetLabel.text = self.tweet.isRetweet ?
        self.tweet.rtText : self.tweet.text
        }
    }
    
//    
//    func setupDetailView(){
//        self.tweetLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        self.tweetLabel.sizeToFit()
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


