//
//  gemPopupViewController.swift
//  HousingSNS
//
//  Created by EiMon on 7/31/15.
//  Copyright (c) 2015 cloudsource. All rights reserved.
//

import UIKit

let identifier = "Cell"
class gemPopupViewController: UIViewController  {
    
    override var preferredContentSize: CGSize {
        get {
            return CGSize(width: 100, height: 400)
        }
        set {
            super.preferredContentSize = newValue
        }
    }
    
}
