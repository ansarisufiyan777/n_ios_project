//
//  AddFriend.swift
//  NimatCollege
//
//  Created by Asna Euphoria on 10/18/16.
//  Copyright © 2016 sufiyan. All rights reserved.
//

import UIKit
import CoreData

class AddFriend: UIViewController {
    
    var friends = [NSManagedObject]()

    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    @IBAction func AddFriend(sender: AnyObject) {
        if (txtGender.text!=="" || txtMobileNumber.text! == "" || txtFullName.text! == "") {
            showDialog()

        }else{
            saveName(txtFullName.text!, number: txtMobileNumber.text!,gender: txtGender.text!,address: txtAddress.text!)
            //fetchData()
            fetchtoArray()
        }
    }
    
    func showDialog(){
        
        let refreshAlert = UIAlertController(title: "Alert", message: "One or more field is empty.", preferredStyle: UIAlertControllerStyle.Alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        presentViewController(refreshAlert, animated: true, completion: nil)
    }
    func saveName(name: String, number: String, gender: String, address: String) {
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Friends",
                                                        inManagedObjectContext:managedContext)
        let v_person = NSManagedObject(entity: entity!,
                                     insertIntoManagedObjectContext: managedContext)
        v_person.setValue(name, forKey: "name")
        v_person.setValue(number, forKey: "phone")
        v_person.setValue(gender, forKey: "gender")
        
        v_person.setValue(address, forKey: "address")
        do {
            try managedContext.save()
            friends.append(v_person)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
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
                if let first = managedObject.valueForKey("name"), last = managedObject.valueForKey("phone") {
                    print("\(first) \(last)")
                }
            }
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
    }

}
