//
//  InfoViewController.swift
//  FakerNews
//
//  Created by Luke Mann on 1/16/17.
//  Copyright © 2017 Luke Mann. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var sizeableContrtat: NSLayoutConstraint!
    @IBOutlet weak var sizeableHight: NSLayoutConstraint!
    @IBOutlet weak var linkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    linkLabel.adjustsFontSizeToFitWidth=true
        //
        let screenSize: CGRect = UIScreen.main.bounds
        
        sizeableHight.constant=screenSize.height/6.5
        sizeableContrtat.constant=sizeableHight.constant-sizeableHight.constant-(sizeableHight.constant*0.03)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
