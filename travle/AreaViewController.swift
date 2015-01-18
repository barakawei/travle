//
//  SpotViewController.swift
//  travle
//
//  Created by Qian Xiaowei on 14-12-21.
//  Copyright (c) 2014年 baraka. All rights reserved.
//

import UIKit

import Haneke

class AreaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
        @IBOutlet var areaTable : UITableView!
    
        @IBOutlet var spotTable : UITableView!
    
        var listAreas : NSMutableArray!
    
        var listSpots : NSMutableArray!
    
        var listSpots1 : NSMutableArray!
    
        var listSpots2 : NSMutableArray!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            var bundle = NSBundle.mainBundle()
            let areaPath : String! = bundle.pathForResource("area", ofType: "plist")
            listAreas = NSMutableArray(contentsOfFile: areaPath)
            
            let spotPath : String! = bundle.pathForResource("spot", ofType: "plist")
            listSpots = NSMutableArray(contentsOfFile: spotPath)

            areaTable?.dataSource = self
            areaTable?.delegate = self
            spotTable?.dataSource = self
            spotTable?.delegate = self
            let view = UIView(frame: CGRectZero);
            areaTable.tableFooterView = view;
            spotTable.tableFooterView = view;
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
                let cellIdentifier : String = "area"
                let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as AreaItemTableViewCell
                var areaTitle : String = listAreas.objectAtIndex(indexPath.row) as String
                cell.areaTitle.text = areaTitle
                return cell
            }else{
                let cellIdentifier : String = "cityItem"
                let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as CityTableViewCell
                var rowDict : NSDictionary = listSpots.objectAtIndex(indexPath.row) as NSDictionary
                let urlString : String = rowDict.objectForKey("img") as String
                //let dataImg : NSData = NSData(contentsOfURL: NSURL(string : url)!)!
                var url: NSURL = NSURL(string: urlString)!
                //cell.img.hnk_setImageFromURL(url)
                //cell.title.text = rowDict.objectForKey("title") as? String
                //cell.subTitle.text = rowDict.objectForKey("subTitle") as? String
                return cell
            }
            
        }
    


    

}
