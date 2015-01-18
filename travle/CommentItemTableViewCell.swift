//
//  CommentItemTableViewCell.swift
//  travle
//
//  Created by Qian Xiaowei on 14-12-26.
//  Copyright (c) 2014年 baraka. All rights reserved.
//

import UIKit

class CommentItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var time: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
