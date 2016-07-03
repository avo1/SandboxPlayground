//
//  NotebooksViewController.swift
//  SandboxPlayground
//
//  Created by mac on 7/3/16.
//  Copyright © 2016 DaveVo. All rights reserved.
//

import UIKit
import CoreData

class NotebooksViewController: CoreDataTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the title
        title = "CoolNotes"
        
        // Get the stack
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let stack = delegate.stack
        
        // Create a fetchrequest
        let fr = NSFetchRequest(entityName: "Notebook")
        fr.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true),
                              NSSortDescriptor(key: "creationDate", ascending: false)]
        
        // Create the FetchedResultsController
        fetchedResultsController =
            NSFetchedResultsController(fetchRequest: fr,
                managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
    }

    // MARK: - TableView data source

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        // This method must be implemented by our subclass. There's no way
        // CoreDataTableViewController can know what type of cell we want to
        // use.
        
        // Find the right notebook for this indexpath
        let nb = fetchedResultsController!.objectAtIndexPath(indexPath) as! Notebook
        
        // Create the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("NotebookCell", forIndexPath: indexPath)
        
        // Sync notebook -> cell
        cell.textLabel?.text = nb.name
        cell.detailTextLabel?.text = String(format: "%d notes", nb.notes!.count)
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "displayNotes" {
            let nextVC = segue.destinationViewController as! NotesViewController
            let ip = tableView.indexPathForSelectedRow
            nextVC.notebookName = tableView.cellForRowAtIndexPath(ip!)?.textLabel?.text
            
            // Create a fetchrequest
            let fr = NSFetchRequest(entityName: "Note")
            fr.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
            
            // Create the predicate
            let nb = fetchedResultsController!.objectAtIndexPath(ip!) as! Notebook
            // Set the filter for the property 'notebook' of a Note
            let p = NSPredicate(format: "notebook = %@", argumentArray: [nb])
            fr.predicate = p
            
            // Create the FetchedResultsController
            let fc = NSFetchedResultsController(fetchRequest: fr,
                                           managedObjectContext: fetchedResultsController!.managedObjectContext,sectionNameKeyPath: nil, cacheName: nil)
            
            nextVC.fetchedResultsController = fc
            
        }
    }

}
