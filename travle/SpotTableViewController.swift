//
//  SpotTableViewController.swift
//  
//
//  Created by Qian Xiaowei on 14-12-6.
//
//

import UIKit

class SpotTableViewController: UITableViewController {
    
    var listSpots : NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        var bundle = NSBundle.mainBundle()
        let plistPath : String! = bundle.pathForResource("spot", ofType: "plist")
        listSpots = NSMutableArray(contentsOfFile: plistPath)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return listSpots.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier : String = "spotItem"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as SpotTableViewCell
        var row = indexPath.row
        var rowDict : NSDictionary = listSpots.objectAtIndex(row) as NSDictionary
        let url : String = rowDict.objectForKey("video_img") as String
        let dataImg : NSData = NSData(contentsOfURL: NSURL(string : url)!)!
        //cell.JieVideoImg.image = UIImage(data: dataImg)
        //cell.JieVideoTitle.text = rowDict.objectForKey("video_title") as? String
        //cell.JieVideoSubTitle.text = rowDict.objectForKey("video_subTitle") as? String

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object : NSDictionary = listSpots[indexPath.row] as NSDictionary
                (segue.destinationViewController as SpotDetailViewController).detailItem = object
            }
        }
    }
    

}
