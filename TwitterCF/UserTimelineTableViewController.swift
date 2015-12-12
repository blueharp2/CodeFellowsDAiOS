//
//  UserTimelineTableViewController.swift
//  TwitterCF
//
//  Created by Lindsey on 12/12/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import UIKit

class UserTimelineTableViewController: UITableViewController {

    
    
    
    class func identifier() -> String {
        return "UserTimelinTableViewController"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
