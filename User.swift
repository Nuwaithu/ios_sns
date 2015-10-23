//
//  User.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/8/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import Foundation

class Player: PFObject, PFSubclassing {
  @NSManaged var image: PFFile
  @NSManaged var user: PFUser
  @NSManaged var fullusername: String?

  //1
  class func parseClassName() -> String {
    return "Player"
  }
  
  //2
  override class func initialize() {
    var onceToken: dispatch_once_t = 0
    dispatch_once(&onceToken) {
      self.registerSubclass()
    }
  }
  
  override class func query() -> PFQuery? {
    let query = PFQuery(className: Player.parseClassName()) //1
    query.includeKey("user") //2
    query.orderByDescending("createdAt") //3
    return query
  }
  
  init(image: PFFile, user: PFUser, comment: String?) {
    super.init()
    
    self.image = image
    self.user = user
    self.fullusername = comment
  }
  
  override init() {
    super.init()
  }
  
}
