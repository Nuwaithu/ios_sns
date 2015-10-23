//
//  UserProfileViewController.swift
//  SNSProject
//
//  Created by Nu Wai Thu on 10/1/15.
//  Copyright (c) 2015 clousource. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
  
  @IBOutlet weak var imageToUpload: UIImageView!
  @IBOutlet weak var commentTextField: UITextField!
  @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
  
  var username: String?
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  // MARK: - Actions
  @IBAction func selectPicturePressed(sender: AnyObject) {
    //Open a UIImagePickerController to select the picture
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    presentViewController(imagePicker, animated: true, completion: nil)
  }
  
  @IBAction func sendPressed(sender: AnyObject) {
    commentTextField.resignFirstResponder()
    
    //Disable the send button until we are ready
    navigationItem.rightBarButtonItem?.enabled = false
    
    loadingSpinner.startAnimating()
    
    //TODO: Upload a new picture
    let pictureData = UIImagePNGRepresentation(imageToUpload.image)
    
    //1
    let file = PFFile(name: "image", data: pictureData)
    file.saveInBackgroundWithBlock({ (succeeded, error) -> Void in
      if succeeded {
        //2
        self.saveUser(file)
      } else if let error = error {
        //3
        self.showErrorView(error)
      }
      }, progressBlock: { percent in
        //4
        println("Uploaded: \(percent)%")
    })
  }
  
  func saveUser(file: PFFile)
  {
    //1
    let user = Player(image: file, user: PFUser.currentUser()!, comment: self.commentTextField.text)
    //2
    user.saveInBackgroundWithBlock{ succeeded, error in
      if succeeded {
        //3
        self.navigationController?.popViewControllerAnimated(true)
      } else {
        //4
        if let errorMessage = error?.userInfo?["error"] as? String {
          self.showErrorView(error!)
        }
      }
    }
  }
  
}

extension UserProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
    //Place the image in the imageview
    imageToUpload.image = image
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
}
