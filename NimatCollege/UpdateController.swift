//
//  UpdateController.swift
//  NimatCollege
//
//  Created by Asna Euphoria on 10/19/16.
//  Copyright © 2016 sufiyan. All rights reserved.
//

import UIKit
import CoreData

class UpdateController: UIViewController {
    var v_tname:String!
    var v_tphone:String!
    var v_tgender:String!
    var v_taddress:String!
    var friends = [NSManagedObject]()

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var contact:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = v_tname
        phone.text = v_tphone
        gender.text = v_tgender
        contact.text = v_taddress
        
        //print(v_tname)
        // Do any additional setup after loading the view.
    }

    @IBAction func UpdateData(sender: AnyObject) {
        if (name.text!=="" || phone.text! == "" || gender.text! == "") {
            showDialog()
            
        }else{
            saveName(name.text!, number: phone.text!,gender: gender.text!,address: contact.text!)
            //fetchData()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func showDialog(){
        
        let refreshAlert = UIAlertController(title: "Alert", message: "One or more field is empty.", preferredStyle: UIAlertControllerStyle.Alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        presentViewController(refreshAlert, animated: true, completion: nil)
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
