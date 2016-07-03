//
//  Note.swift
//  SandboxPlayground
//
//  Created by Dave Vo on 7/3/16.
//  Copyright © 2016 DaveVo. All rights reserved.
//

import Foundation
import CoreData


class Note: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    convenience init(text: String = "New note", context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entityForName("Note", inManagedObjectContext: context) {
            self.init(entity: ent, insertIntoManagedObjectContext: context)
            self.text = text
            self.creationDate = NSDate()
        } else {
            fatalError("couldn't find the entity Note")
        }
    }
    
    var humanReadableDate: String {
        get {
            let fmt = NSDateFormatter()
            fmt.timeStyle = .NoStyle
            fmt.dateStyle = .ShortStyle
            fmt.doesRelativeDateFormatting = true
            fmt.locale = NSLocale.currentLocale()
            
            return fmt.stringFromDate(creationDate!)
        }
    }
}
