//
//  SpotDetailViewController.swift
//  travle
//
//  Created by Qian Xiaowei on 14-12-10.
//  Copyright (c) 2014年 baraka. All rights reserved.
//

import UIKit

import Haneke

class SpotDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //接受传进来的值
    var detailItem: NSDictionary?
    
    @IBOutlet weak var spotImg: UIImageView!
    
    @IBOutlet weak var addressContentView: UIView!
    
    @IBOutlet weak var addressContentLabel: UILabel!
    
    @IBOutlet weak var descTitleView: UIView!
    
    @IBOutlet weak var descContentView: UIView!
    
    @IBOutlet weak var descContentLabel: UILabel!
    
    @IBOutlet weak var infoTitleView: UIView!
    
    @IBOutlet weak var commentTitleView: UIView!
    
    @IBOutlet weak var commentContentView: UIView!
    
    @IBOutlet var commentTable : UITableView!
    
    @IBOutlet var scrollview:UIScrollView?
    
    var recentComment : NSMutableArray!
    
    @IBOutlet weak var wayContentView: UIView!
    
    @IBOutlet weak var wayContentLabel: UILabel!
    
    @IBOutlet weak var timeContentView: UIView!
    
    @IBOutlet weak var timeContentLabel: UILabel!
    
    @IBOutlet weak var ticketContentView: UIView!
    
    @IBOutlet weak var ticketContentLabel: UILabel!
    
    @IBOutlet weak var root: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var bundle = NSBundle.mainBundle()
        let recentCommentPath : String! = bundle.pathForResource("comment", ofType: "plist")
        recentComment = NSMutableArray(contentsOfFile: recentCommentPath)
        commentTable?.dataSource = self
        //info.createTopBorderWithHeight(2, color: UIColor.blackColor())
        //self.view.layoutIfNeeded()
        //info.addTopBorderWithHeight(0.5, color: UIColor.blackColor())
        self.view.layoutIfNeeded()
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "tapGesture:")
        spotImg.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        spotImg.userInteractionEnabled = true
        
        
        //root.bringSubviewToFront(stars);
        
        

        // Do any additional setup after loading the view.
    }
    
    func tapGesture(gesture: UIGestureRecognizer){
        self.performSegueWithIdentifier("showPics", sender:self)
            
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue,sender: AnyObject!)
    {
        super.prepareForSegue(segue, sender:sender)
        if segue.identifier == "showPics"{
            var view:PicCollectionViewController = segue.destinationViewController as PicCollectionViewController
            view.id = self.detailItem!.objectForKey("id") as? String
        }
    }
    
    override func viewDidLayoutSubviews() {
        configureView()
       
        

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
            let detail : NSDictionary = self.detailItem!
            self.title = detail.objectForKey("name") as? String
            let urlString : String = detail.objectForKey("urlLarge") as String
            var url: NSURL = NSURL(string: urlString)!
            self.spotImg.hnk_setImageFromURL(url)
        
        let titleColor: UIColor! = UIColor(hexString: "#d1d3d7")
        let contentColor: UIColor! = UIColor(hexString: "#cfd1d5")
        //简介
        //descTitleView.addTopBorderWithHeight(1, color: titleColor)
        //descTitleView.addBottomBorderWithHeight(1, color: titleColor)
        descContentView.addTopBorderWithHeight(1, color: contentColor)
        descContentLabel.text=detail.objectForKey("info") as? String
        
        //基本信息
        //infoTitleView.addTopBorderWithHeight(1, color: titleColor)
        //infoTitleView.addBottomBorderWithHeight(1, color: titleColor)
        //地址
        addressContentView.addTopBorderWithHeight(1, color: contentColor)
        //addressContentView.addBottomBorderWithHeight(1, color: titleColor)
        addressContentLabel.text=(detail.objectForKey("location") as String)
        //路线
        wayContentView.addTopBorderWithHeight(1, color: contentColor, leftOffset: 0, rightOffset: 28, topOffset: 0)
        wayContentLabel.text=(detail.objectForKey("traffic") as String)
        //时间
        timeContentView.addTopBorderWithHeight(1, color: contentColor, leftOffset: 0, rightOffset: 28, topOffset: 0)
        timeContentLabel.text=(detail.objectForKey("ticket") as String)
        //门票
        
        ticketContentView.addTopBorderWithHeight(1, color: contentColor, leftOffset: 0, rightOffset: 28, topOffset: 0)
        ticketContentLabel.text=(detail.objectForKey("notice") as String)
        
        
        //commentTitleView.addTopBorderWithHeight(1, color: titleColor)
        //commentTitleView.addBottomBorderWithHeight(1, color: titleColor)
        //commentContentView.addTopBorderWithHeight(1, color: contentColor)
        commentContentView.addTopBorderWithHeight(1, color: contentColor, leftOffset: 8, rightOffset: 0, topOffset: 0)
        
        
        scrollview!.contentSize = CGSize(width: scrollview!.contentSize.width, height: CGFloat(1300))
        
        
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return recentComment.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

            let cellIdentifier : String = "commentItem"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as CommentItemTableViewCell
            var rowDict : NSDictionary = recentComment.objectAtIndex(indexPath.row) as NSDictionary
            let urlString : String = rowDict.objectForKey("avatar") as String
            var url: NSURL = NSURL(string: urlString)!
            cell.avatar.hnk_setImageFromURL(url)
            cell.name.text = rowDict.objectForKey("name") as? String
            cell.content.text = rowDict.objectForKey("content") as? String
            cell.time.text = rowDict.objectForKey("time") as? String
            return cell
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
