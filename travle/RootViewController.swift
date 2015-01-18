//
//  RootViewController.swift
//  travle
//
//  Created by Qian Xiaowei on 14-12-13.
//  Copyright (c) 2014年 baraka. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //initControllerView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initControllerView()
    {

        var indexViewController = IndexViewController();

        var tabBarViewControllers = [indexViewController]
        self.setViewControllers(tabBarViewControllers, animated: false)
        
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
