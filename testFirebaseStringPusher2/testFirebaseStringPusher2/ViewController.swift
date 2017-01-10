//
//  ViewController.swift
//  testFirebaseStringPusher2
//
//  Created by Luke Mann on 12/10/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    
    var ref: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // [START create_database_reference]
        ref = FIRDatabase.database().reference()
        // [END create_database_reference]
        
        let doneBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: 320, height: 44))
        doneBar.autoresizingMask = .flexibleWidth
        let flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let done = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(didTapShare))
//        done.tintColor = UIColor(red: 1.0, green: 143.0/255.0, blue: 0.0, alpha: 1.0)
//        doneBar.items  = [flex, done, flex]
        doneBar.sizeToFit()
//        bodyTextView.inputAccessoryView = doneBar
//        titleTextField.inputAccessoryView = doneBar
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

