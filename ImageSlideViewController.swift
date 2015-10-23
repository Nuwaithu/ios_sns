//
//  ImageSlideViewController.swift
//  SNS
//
//  Created by Nu Wai Thu on 10/6/15.
//  Copyright (c) 2015 clousource. All rights reserved.
//

import UIKit

class ImageSlideViewController: UIViewController {

      
    @IBOutlet weak var image1: UIImageView!

    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
    
    @IBOutlet weak var m_Slide: NHSlideShow!
    var s_image : UIImage!
    var com :CommonColor = CommonColor()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.image1.image = UIImage(named:"1.png")
        self.image2.image = UIImage (named:"2.png")
        self.image3.image = UIImage(named: "3.png")
        self.image4.image = UIImage(named: "4.png")
        
        // Do any additional setup after loading the view.
        configureGradientBackground(com.color1.CGColor,com.color3.CGColor) // background color
        m_Slide .slidesWithImages(getImage() as [AnyObject])
    }
    
    func  getImage() -> NSArray
    {
        let img1 : UIImage = UIImage(named: "1.png")!
        let img2 : UIImage = UIImage(named: "2.png")!
        let img3 : UIImage = UIImage(named: "3.png")!
        let img4 : UIImage = UIImage(named: "4.png")!
        let img5 : UIImage =  UIImage(named: "5.png")!
        let arr : NSArray = [img1,img2,img3,img4,img5]
        return arr
        
    }

    override func viewDidLayoutSubviews() {
        
        m_Slide.doneLayout()
        // m_Slide.start()
        
    }

    func configureGradientBackground(colors:CGColorRef...){
        
        
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        let maxWidth = max(self.view.bounds.size.height,self.view.bounds.size.width)
        
        let squareFrame = CGRect(origin: self.view.bounds.origin, size: CGSizeMake(maxWidth, maxWidth))
        
        gradient.frame = squareFrame
        
        
        
        gradient.colors = colors
        
        view.layer.insertSublayer(gradient, atIndex: 0)
        
    }

    
    
    
    @IBAction func btnNext(sender: AnyObject) {
    }
    
    @IBAction func btnPrevious(sender: AnyObject) {
    }
   
    
    
    
    
    
    
}
