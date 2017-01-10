//
//  ViewController.swift
//  AutoLayoutV6
//
//  Created by Luke Mann on 11/24/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondVIew: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupConstraints() {
        let topLayoutGuide=UILayoutGuide()
        let centerLayourGuide=UILayoutGuide()
        let bottomLayoutGuide=UILayoutGuide()
        
        view.addLayoutGuide(topLayoutGuide)
        view.addLayoutGuide(centerLayourGuide)
        view.addLayoutGuide(centerLayourGuide)
        
        let firstViewToTopGuideConstraint = NSLayoutConstraint(item: firstView, attribute: .bottom, relatedBy: .equal, toItem: topLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)
        
        let secondViewToTopGuideConstraint = NSLayoutConstraint(item: secondVIew, attribute: .top, relatedBy: .equal, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        let secondViewToBottomGuideConstraint = NSLayoutConstraint(item: secondVIew, attribute: .bottom, relatedBy: .equal, toItem: centerLayourGuide, attribute: .top, multiplier: 1.0, constant: 0.0)
        
        let thirdViewToCenterGuideConstraint = NSLayoutConstraint(item: thirdView, attribute: .top, relatedBy: .equal, toItem: centerLayourGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        let thirdViewToBottomGuideConstraint = NSLayoutConstraint(item: thirdView, attribute: .bottom, relatedBy: .equal, toItem: bottomLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)
        
        let fourthViewToBottomGuideConstraint = NSLayoutConstraint(item: fourthView, attribute: .top, relatedBy: .equal, toItem: bottomLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        let topGuideHeightConstraint = NSLayoutConstraint(item: topLayoutGuide, attribute: .height, relatedBy: .equal, toItem: centerLayourGuide, attribute: .height, multiplier: 1.0, constant: 0.0)
        
        let centerGuideHeightConstraint = NSLayoutConstraint(item: centerLayourGuide, attribute: .height, relatedBy: .equal, toItem: bottomLayoutGuide, attribute: .height, multiplier: 1.0, constant: 0.0)
        
        view.addConstraints([firstViewToTopGuideConstraint, secondViewToTopGuideConstraint, secondViewToBottomGuideConstraint, thirdViewToCenterGuideConstraint, thirdViewToBottomGuideConstraint, fourthViewToBottomGuideConstraint, topGuideHeightConstraint, centerGuideHeightConstraint])
    }

}

