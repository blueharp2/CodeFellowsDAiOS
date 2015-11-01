//
//  CustomTweetCell.swift
//  TwitterCF
//
//  Created by Lindsey on 10/30/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import UIKit

class CustomTweetCell: UITableViewCell {
    //insert outlets here
    
    @IBOutlet weak var imgView: UIButton!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    
    var tweet: Tweet? {
        didSet {
            if let tweet = self.tweet, user = tweet.user, text = self.tweet?.text{
                self.tweetTextLabel.text = text
                
                if let image = user.image{
                    self.imgView = image
                } else {
                    if let url = NSURL(string: user.profileImage){
                        let downloadQ = dispatch_queue_create("downloadQ", nil)
                            dispatch_async(downloadQ, { () -> Void in
                                let imageData = NSData(contentsOfURL: url)!
                                
                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                    let image = UIImage (data: imageData)
                                    self.imgView.image = image
                                    user.image = image
                                    })
                                })
                            }
                        }
                    }
                }
            }
    class func identifier() -> String{
        return "CustomTweetCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
//    self.imgView.setBackgroundImage(image: UIImage?, forState: UIControlState.Normal){
//        self.image = image
//
//    func ImageView(){
//    self.imgView.setBackgroundImage(image: UIImage, forState: UIControlState.Normal)
//    }