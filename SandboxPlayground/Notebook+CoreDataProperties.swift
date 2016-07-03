//
//  Notebook+CoreDataProperties.swift
//  SandboxPlayground
//
//  Created by Dave Vo on 7/3/16.
//  Copyright © 2016 DaveVo. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Notebook {

    @NSManaged var name: String?
    @NSManaged var creationDate: NSDate?
    @NSManaged var notes: NSSet?

}
