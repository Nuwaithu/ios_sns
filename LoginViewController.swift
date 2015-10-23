//
//  LoginViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/6/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController,PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
  
  @IBOutlet weak var userTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  let scrollViewWallSegue = "LoginSuccesful"
  //let tableViewWallSegue = "LoginSuccesfulTable"
   // let tabbarViewSegue = "Tabbarview"
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let user = PFUser.currentUser() {
      if user.isAuthenticated() {
        println("Success")
       // self.performSegueWithIdentifier(tableViewWallSegue, sender: nil)
      }
    }
  }
  
  // MARK: - Actions
  @IBAction func logInPressed(sender: AnyObject) {
    PFUser.logInWithUsernameInBackground(userTextField.text, password: passwordTextField.text) { user, error in
      if user != nil {
        println("Success")
        var detail : UITabBarController = self.storyboard?.instantiateViewControllerWithIdentifier("UITabBarController")as! UITabBarController
        self.presentViewController(detail, animated: true, completion: nil)
        //self.performSegueWithIdentifier(self.tableViewWallSegue, sender: nil)
      } else if let error = error {
        self.showErrorView(error)
      }
    }
  }
    
 //twetterlogin
    
   /* func logInViewController(logInController: LoginViewController!, didLogInUser user: PFUser!) {
        
        if (PFTwitterUtils.isLinkedWithUser(user)) {
            
            var twitterUsername = PFTwitterUtils.twitter().screenName
            
            PFUser.currentUser().username = twitterUsername
            
            PFUser.currentUser().saveEventually(nil)
            
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }*/
    
   
    @IBAction func twitterlogin(sender: AnyObject) {
        
        PFTwitterUtils.logInWithBlock {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in with Twitter!")
                    var detail : UITabBarController = self.storyboard?.instantiateViewControllerWithIdentifier("UITabBarController") as! UITabBarController
                    self.presentViewController(detail, animated: true, completion: nil)

                    
                } else {
                    var detail : UITabBarController = self.storyboard?.instantiateViewControllerWithIdentifier("UITabBarController") as! UITabBarController
                    self.presentViewController(detail, animated: true, completion: nil)

                    
                    print("User logged in with Twitter!")
                }
            } else {
                print("Uh oh. The user cancelled the Twitter login.")
            }
        }
    }
    
    func processTwitteruser(){
        
        
    }

    //FBLogin
    let permissions = ["public_profile"]
    @IBAction func fbLoginClick(sender: AnyObject) {
        PFFacebookUtils.logInWithPermissions(self.permissions, /*block; added*/block: {
            (user: PFUser?, error: NSError?) -> Void in //switched ! to ?
            if user == nil {
                NSLog("Uh oh. The user cancelled the Facebook login.")
            } else if user!.isNew { //inserted !
                NSLog("User signed up and logged in through Facebook!")
            } else {
                NSLog("User logged in through Facebook! \(user!.username)")
            }
        })
    }
}
