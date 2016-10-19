//
//  Friend.swift
//  NimatCollege
//
//  Created by Asna Euphoria on 10/20/16.
//  Copyright © 2016 sufiyan. All rights reserved.
//

import Foundation
import CoreData

@objc(Friend)
class Friend: NSManagedObject {
    @NSManaged var name:String?
    @NSManaged var phone:String?
    @NSManaged var gender:String?
    @NSManaged var contact:String?
    
    
}