//
//  NoticeWebViewController.swift
//  travle
//
//  Created by Qian Xiaowei on 14-12-29.
//  Copyright (c) 2014年 baraka. All rights reserved.
//

import UIKit

class NoticeWebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let webView = UIWebView()
        self.view.addSubview(webView)
        webView.frame = view.bounds
        webView.scalesPageToFit = true


        var url:NSURL = NSURL(string:"http://windoor.sinaapp.com/travel/index.html")!
        var request:NSURLRequest = NSURLRequest(URL:url)
        webView.loadRequest(request)
        
        //let htmlFilePath = NSBundle.mainBundle().pathForResource("index", ofType: "html")!
        // 1.
        //webView.loadData(NSData(contentsOfFile: htmlFilePath), MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: nil)
        
        // 2.
        //webView.loadHTMLString(NSString(contentsOfFile: htmlFilePath, encoding: NSUTF8StringEncoding, error: nil), baseURL: nil)


        // Do any additional setup after loading the view.
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
