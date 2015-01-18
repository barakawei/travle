//
//  ReportViewController.swift
//  travle
//
//  Created by Qian Xiaowei on 15-1-7.
//  Copyright (c) 2015年 baraka. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    @IBOutlet weak var firstField: UITextView!
    
    @IBOutlet weak var secondField: UITextView!
    
    @IBOutlet weak var thirdField: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backgroundTap() {
        firstField.resignFirstResponder()
        secondField.resignFirstResponder()
        thirdField.resignFirstResponder()
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
