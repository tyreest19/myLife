//
//  Post+CoreDataProperties.swift
//  mylife
//
//  Created by Tyree Stevenson on 3/23/16.
//  Copyright © 2016 Tyree Stevenson. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Post {

    @NSManaged var image: NSData?
    @NSManaged var mood: String?
    @NSManaged var moment: String?

}
