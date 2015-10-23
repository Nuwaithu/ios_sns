//
//  PhotoCell.swift
//  HousingSNS
//
//  Created by EiMon on 7/31/15.
//  Copyright (c) 2015 cloudsource. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    
    @IBOutlet weak var goodlabel: UILabel!
    
    @IBOutlet weak var good: UIButton!
    @IBOutlet weak var l_img: UIImageView!
    @IBOutlet weak var l_userName: UILabel!
    
    @IBOutlet weak var starbtn: UIButton!
    var isChecked = false
    
    
    
    @IBAction func starbtn(sender: AnyObject) {
        if(isChecked) {
            isChecked = !isChecked
            starbtn.setBackgroundImage(UIImage(named: "emptyStar.png"), forState: UIControlState.Normal)
        }
        else{
            isChecked = !isChecked
            starbtn.setBackgroundImage(UIImage(named: "filledStar.png"), forState: UIControlState.Normal)
        }
    }
    
    @IBAction func goodaction(sender: AnyObject) {
        
        if goodlabel.text == "いいね"{
            goodlabel.text = nil
        }
        else{
            goodlabel.text = "いいね"
        }
        
        
    }
}
