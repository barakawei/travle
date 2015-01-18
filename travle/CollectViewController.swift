//
//  SpotViewController.swift
//  travle
//
//  Created by Qian Xiaowei on 14-12-21.
//  Copyright (c) 2014年 baraka. All rights reserved.
//

import UIKit

import Haneke

import SwiftyJSON

import Alamofire

class CollectViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
        @IBOutlet var spotTable : UITableView!
    
        var listSpots : NSMutableArray! = []
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            var bundle = NSBundle.mainBundle()
            
            loadSpotData("4")

          
            spotTable?.dataSource = self
            spotTable?.delegate = self
            let view = UIView(frame: CGRectZero);
            spotTable.tableFooterView = view;
        }
    
    
    func loadSpotData(id:String){
        listSpots.removeAllObjects()
        let url = NSURL(string: "http://localhost:9000/scenics/"+id)!
        Alamofire.request(.GET, url)
            .responseJSON { (_, _, json, error) in
                if(error != nil) {
                    NSLog("Error: \(error)")
                }else {
                    let jsonSpots = JSON(json!).arrayValue
                    for (spot: SwiftyJSON.JSON) in jsonSpots {
                        var spotDict = ["id": spot["id"].stringValue,"name": spot["name"].stringValue, "info": spot["info"].stringValue,"url":spot["url"].stringValue,"ticket":spot["ticket"].stringValue,"location":spot["location"].stringValue,"traffic":spot["traffic"].stringValue,"notice":spot["notice"].stringValue,"urlLarge":spot["urlLarge"].stringValue]
                        self.listSpots.addObject(spotDict)
                    }
                    self.spotTable.reloadData()
                }
        }
    }
    
    
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
 
        func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {

            return listSpots.count
            
            
        }
        

        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

            let cellIdentifier : String = "spotItem"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as SpotTableViewCell
            var rowDict : NSDictionary = listSpots.objectAtIndex(indexPath.row) as NSDictionary
            let urlString : String = rowDict.objectForKey("url") as String
            //let dataImg : NSData = NSData(contentsOfURL: NSURL(string : url)!)!
            var url: NSURL = NSURL(string: urlString)!
            cell.img.hnk_setImageFromURL(url)
            cell.title.text = rowDict.objectForKey("name") as? String
            cell.subTitle.text = rowDict.objectForKey("info") as? String
            return cell
        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            if let indexPath = self.spotTable.indexPathForSelectedRow() {
                let object : NSDictionary = listSpots[indexPath.row] as NSDictionary
                (segue.destinationViewController as SpotDetailViewController).detailItem = object
            }
        }
    }
    


    

}
