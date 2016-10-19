//
//  ViewController.swift
//  NimatCollege
//
//  Created by Asna Euphoria on 10/16/16.
//  Copyright © 2016 sufiyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let username = "username"
    let password = "password"
    

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSignIn(sender: AnyObject) {
        let tx = txtUsername.text
        let tp = txtPassword.text
        if (tx==username && tp == password) {
            self.performSegueWithIdentifier("mainHomeSegue", sender: nil)

        }else{
            showDialog()
        }
    }
    func showDialog(){
        
        let refreshAlert = UIAlertController(title: "Alert", message: "Please check username or password.", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
        
    }
    

}

