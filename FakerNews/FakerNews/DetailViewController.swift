//
//  DetailViewController.swift
//  FakerNews
//
//  Created by Luke Mann on 1/15/17.
//  Copyright © 2017 Luke Mann. All rights reserved.
//

import UIKit
import ChameleonFramework



class DetailViewController: UIViewController {
    
    @IBOutlet weak var sourceValueLabel: UILabel!
    @IBOutlet weak var credibleValueLabel: UILabel!
    @IBOutlet weak var typeValueLabel: UILabel!
    @IBOutlet weak var notesValueLabell: UILabel!
    @IBOutlet weak var languageValueLabel: UILabel!
    @IBOutlet weak var arrow: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var sizableHeight: NSLayoutConstraint!
  
    @IBOutlet weak var sizableConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesValueLabell.adjustsFontSizeToFitWidth=true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if (appDelegate.credible) {
            credibleValueLabel.text="credible"
            self.view.backgroundColor=UIColor.flatGreen
            sourceValueLabel.textColor=UIColor(contrastingBlackOrWhiteColorOn:FlatGreen(), isFlat:true)
            credibleValueLabel.textColor=UIColor(contrastingBlackOrWhiteColorOn:FlatGreen(), isFlat:true)
            typeValueLabel.textColor=UIColor(contrastingBlackOrWhiteColorOn:FlatGreen(), isFlat:true)
            notesValueLabell.textColor=UIColor(contrastingBlackOrWhiteColorOn:FlatGreen(), isFlat:true)
            languageValueLabel.textColor=UIColor(contrastingBlackOrWhiteColorOn:FlatGreen(), isFlat:true)
            arrow.tintColor=UIColor.darkGray
        }
        else {
            credibleValueLabel.text="not credible"
            self.view.backgroundColor=UIColor.flatRed
            sourceValueLabel.textColor=UIColor(contrastingBlackOrWhiteColorOn:FlatRed(), isFlat:true)
            credibleValueLabel.textColor=UIColor(contrastingBlackOrWhiteColorOn:FlatRed(), isFlat:true)
            typeValueLabel.textColor=UIColor(contrastingBlackOrWhiteColorOn:FlatRed(), isFlat:true)
            notesValueLabell.textColor=UIColor(contrastingBlackOrWhiteColorOn:FlatRed(), isFlat:true)
            languageValueLabel.textColor=UIColor(contrastingBlackOrWhiteColorOn:FlatRed(), isFlat:true)
            infoButton.tintColor=UIColor.lightGray



        }
        sourceValueLabel.text=appDelegate.name
        typeValueLabel.text=appDelegate.type
        notesValueLabell.text=appDelegate.notes
        languageValueLabel.text=appDelegate.language
//
        let screenSize: CGRect = UIScreen.main.bounds

        sizableHeight.constant=screenSize.height/9.4
        sizableConstraint.constant=sizableHeight.constant-sizableHeight.constant-(sizableHeight.constant*0.03)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

