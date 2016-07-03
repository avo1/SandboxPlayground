//
//  Notebook.swift
//  SandboxPlayground
//
//  Created by Dave Vo on 7/3/16.
//  Copyright © 2016 DaveVo. All rights reserved.
//

import Foundation
import CoreData


class Notebook: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    convenience init(name: String, context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entityForName("Notebook", inManagedObjectContext: context) {
            self.init(entity: ent, insertIntoManagedObjectContext: context)
            self.name = name
            self.creationDate = NSDate()
        } else {
            fatalError("cound't find the entity for Notebook")
        }
    }
}
