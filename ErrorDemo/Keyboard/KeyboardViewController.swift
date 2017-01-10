//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Luke Mann on 1/8/17.
//  Copyright © 2017 Luke Mann. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    @IBOutlet var hapticButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
        
        
         self.hapticButton = UIButton(type: .system)
        self.hapticButton.setTitle(NSLocalizedString("Press Me", comment: "Foo"), for: [])
        self.hapticButton.sizeToFit()
        self.hapticButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.hapticButton.addTarget(self, action: #selector(self.buttonPressed), for: .allTouchEvents)
        
        self.view.addSubview(self.hapticButton)
        
        self.hapticButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.hapticButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
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
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    func buttonPressed() {
        print("Here1")
        let generator=UIImpactFeedbackGenerator(style: .light)
        print("Here2")
        generator.impactOccurred()
        print("Here3")

    }

}
