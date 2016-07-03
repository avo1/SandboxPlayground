//
//  NotesViewController.swift
//  SandboxPlayground
//
//  Created by mac on 7/3/16.
//  Copyright © 2016 DaveVo. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: CoreDataTableViewController {

    var notebookName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set the title to be the Notebook name
        title = notebookName
        
    }

    // MARK: - TableView data source
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Get the note
        let note = fetchedResultsController!.objectAtIndexPath(indexPath) as! Note
        
        // Create the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath)
        
        // Sync note -> cell
        cell.textLabel?.text = note.text
        
        return cell
    }

    @IBAction func addNote(sender: UIBarButtonItem) {
        let newNote = Note(text: "A new note", context: fetchedResultsController!.managedObjectContext)
        newNote.notebook = notebookName
        print("a new note created")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
