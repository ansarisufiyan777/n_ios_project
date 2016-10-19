//
//  CustomTableViewController.swift
//  NimatCollege
//
//  Created by Asna Euphoria on 10/19/16.
//  Copyright © 2016 sufiyan. All rights reserved.
//

import UIKit
import CoreData

class CustomTableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    var tname: [String] = []
    var tphone: [String] = []
    var tgender: [String] = []
    var taddress: [String] = []
    
    var v_tname:String!
    var v_tphone:String!
    var v_tgender:String!
    var v_taddress:String!


    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchtoArray()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tname.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomeCell
        cell.name.text = tname[indexPath.row]
        cell.gender.text=tgender[indexPath.row]
        cell.phone.text=tphone[indexPath.row]
        cell.address.text=taddress[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        v_tname = tname[row];
        v_tphone = tphone[row];
        v_taddress = taddress[row];
        v_tgender = tgender[row];
        
        self.performSegueWithIdentifier("segueUpdate", sender: nil)

        print(tname[row])
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "segueUpdate") {
            let viewController = segue.destinationViewController as! UpdateController
            viewController.v_tname = v_tname
            viewController.v_tphone = v_tphone
            viewController.v_tgender = v_tgender
            viewController.v_taddress = v_taddress
            
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
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
                if let names = managedObject.valueForKey("name"), phones = managedObject.valueForKey("phone"), genders = managedObject.valueForKey("gender"), address = managedObject.valueForKey("address") {
                    tname.append((names) as! String)
                    tphone.append((phones) as! String)
                    tgender.append((genders) as! String)
                    taddress.append((address) as! String)
                    print((names))
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
