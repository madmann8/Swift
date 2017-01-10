//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Luke Mann on 12/24/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    var calculatorView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()

           }
    func loadInterface() {
        // load the nib file
        var calculatorNib = UINib(nibName: "View", bundle: nil)
        // instantiate the view
        calculatorView = calculatorNib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        // add the interface to the main view
        view.addSubview(calculatorView)
        
        // copy the background color
        view.backgroundColor = calculatorView.backgroundColor
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    @IBAction func pressedButton(_ sender: Any) {
     print("Hi")
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()

    }

}
