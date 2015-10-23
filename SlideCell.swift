//
//  SlideCell.swift
//  HousingSNS
//
//  Created by EiMon on 8/12/15.
//  Copyright (c) 2015 cloudsource. All rights reserved.
//

import UIKit

class SlideCell: UITableViewCell {

    @IBOutlet weak var s_userName: UILabel!
    @IBOutlet weak var s_cmt: UITextView!
    
    @IBOutlet weak var s_postCmt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
