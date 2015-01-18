//
//  IndexViewController.swift
//  travle
//
//  Created by Qian Xiaowei on 14-12-13.
//  Copyright (c) 2014年 baraka. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController{
    
    @IBOutlet var noticeImg : UIImageView!
    
    @IBOutlet var spotImg : UIImageView!
    
    @IBOutlet var rankImg : UIImageView!
    
    @IBOutlet var searchImg : UIImageView!
    
    @IBOutlet var collectImg : UIImageView!
    
    @IBOutlet var reportImg : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // create tap gesture recognizer
        let noticeGesture = UITapGestureRecognizer(target: self, action: "notice:")
        noticeImg.addGestureRecognizer(noticeGesture)
        noticeImg.userInteractionEnabled = true
        
        let rankGesture = UITapGestureRecognizer(target: self, action: "rank:")
        rankImg.addGestureRecognizer(rankGesture)
        rankImg.userInteractionEnabled = true
        
        let searchGesture = UITapGestureRecognizer(target: self, action: "search:")
        searchImg.addGestureRecognizer(searchGesture)
        searchImg.userInteractionEnabled = true
        
        let reportGesture = UITapGestureRecognizer(target: self, action: "report:")
        reportImg.addGestureRecognizer(reportGesture)
        reportImg.userInteractionEnabled = true
        
        let collectGesture = UITapGestureRecognizer(target: self, action: "collect:")
        collectImg.addGestureRecognizer(collectGesture)
        collectImg.userInteractionEnabled = true
    }
    
    func notice(gesture: UIGestureRecognizer){
       self.performSegueWithIdentifier("showNotice", sender: nil)
    }
    
    func rank(gesture: UIGestureRecognizer){
        self.tabBarController?.selectedIndex = 1
        
    }
    
    func search(gesture: UIGestureRecognizer){
        self.tabBarController?.selectedIndex = 2
        
    }
    
    func report(gesture: UIGestureRecognizer){
        self.tabBarController?.selectedIndex = 3
        
    }
    
    func collect(gesture: UIGestureRecognizer){
        self.tabBarController?.selectedIndex = 4
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
