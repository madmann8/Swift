//
//  ViewController.swift
//  AutoLayout3
//
//  Created by Luke Mann on 11/14/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelOne.text="Lorem ipsum dolor sit amet foooo"
        labelTwo.text="Lorem ipsum dolor sit amet"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

