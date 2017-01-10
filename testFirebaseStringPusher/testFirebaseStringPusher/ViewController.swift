//
//  ViewController.swift
//  testFirebaseStringPusher
//
//  Created by Luke Mann on 12/9/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {


    var ref: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
//        ref = FIRDatabase.database().reference()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    @IBAction func buttonPressed(_ sender: Any) {
//        self.ref.child("messages").setValue(["username": textField.text])
//
//    }
}

