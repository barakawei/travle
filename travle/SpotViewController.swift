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

class SpotViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    
        @IBOutlet var areaTable : UITableView!
    
        @IBOutlet var spotTable : UITableView!
    
        var jsonAreas : Array<SwiftyJSON.JSON>!
    
        var listAreas : NSMutableArray! = []
    
        var listSpots : NSMutableArray! = []
    
        var listSpots1 : NSMutableArray!
    
        var listSpots2 : NSMutableArray!
    
        override func viewDidLoad() {
            super.viewDidLoad()
        
            loadAreaData()
            loadSpotData("1")
            
            var bundle = NSBundle.mainBundle()
            
            
            listSpots1 = NSMutableArray(contentsOfFile: bundle.pathForResource("spot1", ofType: "plist")!)
            
            listSpots2 = NSMutableArray(contentsOfFile: bundle.pathForResource("spot", ofType: "plist")!)

            areaTable?.dataSource = self
            areaTable?.delegate = self
            spotTable?.dataSource = self
            spotTable?.delegate = self
            let view = UIView(frame: CGRectZero);
            areaTable.tableFooterView = view;
            spotTable.tableFooterView = view;
        }
    
    func loadAreaData(){
        let url = NSURL(string: "http://localhost:9000/areas")!
        Alamofire.request(.GET, url)
            .responseJSON { (_, _, json, error) in
                if(error != nil) {
                    NSLog("Error: \(error)")
                }else {
                    self.jsonAreas = JSON(json!).arrayValue
                    for (area: SwiftyJSON.JSON) in self.jsonAreas {
                        self.listAreas.addObject(area["name"].stringValue)
                    }
                    self.areaTable.reloadData()
                }
        }
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
            if tableView == areaTable {
                return listAreas.count
            }else{
                return listSpots.count
            }
            
        }
        

        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            if tableView == areaTable {
                let cellIdentifier : String = "areaItem"
                let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as AreaItemTableViewCell
                var areaTitle : String = self.listAreas.objectAtIndex(indexPath.row) as String
                cell.areaTitle.text = areaTitle
                return cell
            }else{
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
            
        }
    
        func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
            if tableView == areaTable {
                let id = self.jsonAreas[indexPath.row]["id"].stringValue
                loadSpotData(id)
            }
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
