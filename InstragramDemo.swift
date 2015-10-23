//
//  InstragramDemo.swift
//  SNS
//
//  Created by Nu Wai Thu on 10/6/15.
//  Copyright (c) 2015 clousource. All rights reserved.
//

import UIKit
import Foundation

extension String {
    
    func stringByAppendingPathComponent(path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathComponent(path)
    }
}

class InstragramDemo: UIViewController,UIDocumentInteractionControllerDelegate {

    private var YourImage:UIImage! //Replace with your image
    private var documentController:UIDocumentInteractionController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postToInstagram()
    }
    
    
    func postToInstagram(){
        
            
        let instagramUrl = NSURL(string: "instagram://app")
        if(UIApplication.sharedApplication().canOpenURL(instagramUrl!)){
            
            //Instagram App avaible
            
            let imageData = UIImageJPEGRepresentation(YourImage, 100)
            let captionString = "Your Caption"
            let writePath = NSTemporaryDirectory().stringByAppendingPathComponent("instagram.igo")
            //let writePath = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent("instagram.igo")
            
            if(!imageData!.writeToFile(writePath, atomically: true)){
                //Fail to write. Don't post it
                return
            } else{
                //Safe to post
                
                let fileURL = NSURL(fileURLWithPath: writePath)
                self.documentController = UIDocumentInteractionController(URL: fileURL!)
                self.documentController.delegate = self
                self.documentController.UTI = "com.instagram.exclusivegram"
                self.documentController.annotation =  NSDictionary(object: captionString, forKey: "InstagramCaption")
                self.documentController.presentOpenInMenuFromRect(self.view.frame, inView: self.view, animated: true)
            }
        } else {
            //Instagram App NOT avaible...
            print("No Instragram", terminator: "")
        }
    }
}