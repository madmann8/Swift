//
//  ViewController.swift
//  AutoLayoutV7
//
//  Created by Luke Mann on 11/27/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let orangeView=UIView()
    let blueView=UIView()
    let purpleView=UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        orangeView.backgroundColor=UIColor(red: 255/255.0, green: 148/255.0, blue: 0.0, alpha: 1.0)
        
        blueView.backgroundColor=UIColor(red: 187/255.0, green: 44/255.0, blue: 162.0, alpha: 1.0)
        
        purpleView.backgroundColor=UIColor(red: 122/255.0, green: 2068/255.0, blue: 255.0, alpha: 1.0)
        orangeView.translatesAutoresizingMaskIntoConstraints=false
        blueView.translatesAutoresizingMaskIntoConstraints=false
        purpleView.translatesAutoresizingMaskIntoConstraints=false
        
        view.addSubview(orangeView)
        view.addSubview(purpleView)
        view.addSubview(blueView)
        
        let views: [String:AnyObject]=[
            "orangeView":orangeView,
            "purpleView":purpleView,
            "blueView":blueView,
            "topLayoutGuide":self.topLayoutGuide
        ]
        
        let metrics:[String:AnyObject]=[
            "orangeViewWidth":200 as AnyObject,
            "orangeViewHeight":57 as AnyObject,
            "bottomSpaceOffset":50 as AnyObject,
            "standardOffset":8 as AnyObject


        ]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[orangeView(orangeViewWidth)]", options: [], metrics: metrics, views: views))
        orangeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-standardOffset-[purpleView]-standardOffset-[orangeView(orangeViewHeight)]-bottomSpaceOffset-|", options: [], metrics: metrics, views: views))

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-standardOffset-[blueView]-standardOffset-[orangeView]", options: [], metrics: metrics, views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-standardOffset-[purpleView(==blueView)]-standardOffset-[blueView]-standardOffset-|", options: [], metrics: metrics, views: views))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

