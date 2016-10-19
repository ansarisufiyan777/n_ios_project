//
//  CurrentFriendsController.swift
//  NimatCollege
//
//  Created by Asna Euphoria on 10/16/16.
//  Copyright © 2016 sufiyan. All rights reserved.
//

import UIKit
import CoreData

class CurrentFriendsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //@IBOutlet var tableView: UITableView!

    @IBOutlet weak var tableView: UITableView!
    let textCellIdentifier = "TextCell"

    //let swiftBlogs = ["Sufiyan", "Asna Euphoria", "Asna", "Bill", "Steve", "Mark", "Dennis", "Infinity", "Apple", "Mango"]
    var name: [String] = []
    var phone: [String] = []
    var gender: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchtoArray()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = name[row]
        
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print(name[row])
    }
    func fetchtoArray(){
        // Create Fetch Request
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Friends")
        
        // Add Sort Descriptor
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Execute Fetch Request
        do {
            let result = try managedContext.executeFetchRequest(fetchRequest)
            
            for managedObject in result {
                if let names = managedObject.valueForKey("name"), phones = managedObject.valueForKey("phone"), genders = managedObject.valueForKey("gender") {
                    print("\(names) \(phones)")
                    name.append((names) as! String)
                    phone.append((phones) as! String)
                    gender.append((genders) as! String)
                    
                }
            }
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            
        }

    }

}
