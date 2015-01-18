//
//  SpotTableViewCell.swift
//  travle
//
//  Created by Qian Xiaowei on 14-12-6.
//  Copyright (c) 2014年 baraka. All rights reserved.
//

import UIKit

class SpotTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
