//
//  LookPhotoViewController.swift
//  SNS
//
//  Created by Nu Wai Thu on 9/29/15.
//  Copyright (c) 2015 clousource. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class LookPhotoViewController: UIViewController , UISearchBarDelegate ,UIGestureRecognizerDelegate, UIPopoverPresentationControllerDelegate{
    
    @IBOutlet weak var m_search: UISearchBar!
    @IBOutlet weak var m_collect: UICollectionView!
    
    var icon: PhotoCell!
    var imageFileNames = [String]()
    var selectedPhotoName = String()
    
    var isSearchOn = false
    
    var searchResults = [String]()
    
    var com :CommonColor = CommonColor()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        
        
        configureGradientBackground(com.color1.CGColor,com.color3.CGColor) // background color
        
        loadImages()
        
       // m_collect.allowsMultipleSelection = true
        
       // m_collect.delaysContentTouches = false
        
       // m_collect.backgroundColor = UIColor.whiteColor()
        
    }
    
    func configureGradientBackground(colors:CGColorRef...){
    
    
        let gradient: CAGradientLayer = CAGradientLayer()

        let maxWidth = max(self.view.bounds.size.height,self.view.bounds.size.width)
    
        let squareFrame = CGRect(origin: self.view.bounds.origin, size: CGSizeMake(maxWidth, maxWidth))
        
        gradient.frame = squareFrame
        
        gradient.colors = colors
        
        view.layer.insertSublayer(gradient, atIndex: 0)
        
        
        
    }
    
    func loadImages() {
        
          var mainBundle: NSBundle = NSBundle.mainBundle()
           var results:NSArray = mainBundle.pathsForResourcesOfType("jpg",inDirectory:nil)
          var dirPaths: Array = results as AnyObject as! [String]
        
          for path in dirPaths {
            
            var objectArray = path.componentsSeparatedByString("/")
            
            imageFileNames.append(objectArray.removeLast())
            
        }
        
                
    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

            return 1

        }

        

        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            if isSearchOn == true && !searchResults.isEmpty {

                return searchResults.count

            } else {

                return imageFileNames.count

            }

        }

        

        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

            icon = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoCell

            var photoName = String()

            

            

            if isSearchOn == true && !searchResults.isEmpty {

                photoName = searchResults[indexPath.item]

            } else {

                photoName = imageFileNames[indexPath.item]

            }

            



            icon.l_img.image = UIImage(named: photoName)

            var stringArray: Array = photoName.componentsSeparatedByString(".")

            

            return icon

        }

        

    

        

        func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

            // Put the selected collection view cell's photo file name in a variable

            if isSearchOn == true && !searchResults.isEmpty {

                selectedPhotoName = searchResults[indexPath.row] as String

            } else {

                selectedPhotoName = imageFileNames[indexPath.row] as String

            }

            NSLog("image name :", selectedPhotoName)

            print("Cell \(indexPath.row) selected", terminator: "")

            

            var cell = collectionView.cellForItemAtIndexPath(indexPath) as! PhotoCell

            var imageViewObject :UIImageView

            

            imageViewObject = UIImageView(frame:CGRectMake(0, 0, 136, 114))

            

            imageViewObject.image = UIImage(named:"Overlay.png")

            if (cell.selected)

            {

                cell.backgroundColor = UIColor.greenColor()

                

                cell.l_img.addSubview(imageViewObject)

                

                cell.l_img.sendSubviewToBack(imageViewObject)

                

            }

            else {

                

                cell.backgroundColor = UIColor.redColor()

                

            }

            

        }

        

        func searchBarCancelButtonClicked(searchBar: UISearchBar) {

            searchBar.text = nil // Clear out the Search Bar's text field

            searchBar.showsCancelButton = false // Hide the Search Bar's Cancel button

            searchBar.resignFirstResponder()  // Dismiss the keyboard

            isSearchOn = false // Turn off search function

            self.m_collect.reloadData()  // Refresh the collection view

        }

        

        // this function is fired when the user start entering text in the Search Bar's text field

        func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {

            searchBar.showsCancelButton = true  // Show the Search Bar's Cancel button

            if !searchText.isEmpty {

                isSearchOn = true  // Turn on searching function

                self.filterContentForSearchText() // Search the collection view's dataSource

                self.m_collect.reloadData()

            }

        }

        

        

        func filterContentForSearchText() {

            

            searchResults.removeAll(keepCapacity: false)

            

            for imageFileName in imageFileNames {

                let stringToLookFor = imageFileName as NSString

                let sourceString = m_search.text as NSString

                

                if stringToLookFor.localizedCaseInsensitiveContainsString(sourceString as String) {

                    searchResults.append(imageFileName)

                }

            }

        }

        

        func collectionViewBackgroundTapped() {

            m_search.resignFirstResponder()

        }

        

        //gem pop up

        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)

        {

            if let popupView = segue.destinationViewController as? UIViewController

            {

                if let popup = popupView.popoverPresentationController

                {

                    popup.delegate = self

                }

            }

        }

        

        func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle

        {

            return UIModalPresentationStyle.None

        }
    

              
        
}
