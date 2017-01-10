//
//  ViewController.swift
//  SliddenExample
//
//  Created by Daniel Brim on 9/11/14.
//  Copyright (c) 2014 Daniel Brim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textBox: UITextField!
    
    var constraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardAppeared(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDisappeared(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        //Loads
        print("Herrree")

        constraint = NSLayoutConstraint(item: textBox, attribute: .bottomMargin, relatedBy: .equal, toItem: self.view, attribute: .bottomMargin, multiplier: 1.0, constant: -20.0)

        self.view.addConstraint(constraint)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///MARK: Keyboard
    func keyboardAppeared(_ notification: Notification) {
        if let info = notification.userInfo {
            print("herr")
            let frame = (info["UIKeyboardFrameEndUserInfoKey"] as! NSValue).cgRectValue
            self.constraint.constant = -frame.size.height - 20;
        }
    }
    
    func keyboardDisappeared(_ notification: Notification) {
        
    }
}

