//
//  PicCollectionViewController.swift
//  travle
//
//  Created by Qian Xiaowei on 14-12-28.
//  Copyright (c) 2014年 baraka. All rights reserved.
//

import UIKit

import Alamofire

import SwiftyJSON



class PicCollectionViewController: UICollectionViewController {

    var items : [String] = []
    
    var id:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.registerClass(PicCollectionViewCell.self, forCellWithReuseIdentifier: "picCell")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(73, 73) //87
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        self.collectionView?.collectionViewLayout = layout
        
        self.loadPicData(id)
    }
    
    // MARK: UIViewCollectionViewDataSource
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("picCell", forIndexPath: indexPath) as PicCollectionViewCell
        let URLString = self.items[indexPath.row]
        let URL = NSURL(string:URLString)!
        cell.imageView.hnk_setImageFromURL(URL)
        return cell
    }
    
    func loadPicData(id:String){
        let url = NSURL(string: "http://localhost:9000/scenics/"+id+"/pics")!
        Alamofire.request(.GET, url)
            .responseJSON { (_, _, json, error) in
                if(error != nil) {
                    NSLog("Error: \(error)")
                }else {
                    let jsonPics = JSON(json!).arrayValue
                    for (pic: SwiftyJSON.JSON) in jsonPics {
                        self.items.append(pic["url"].stringValue)
                    }
                    self.collectionView?.reloadData()
                    
                }
        }
    }
}
