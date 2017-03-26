//
//  DetailViewController.swift
//  FakeNews
//
//  Created by Luke Mann on 1/12/17.
//  Copyright © 2017 Luke Mann. All rights reserved.
//

import Foundation
import UIKit
import Hero

class DetailViewController: ViewController {
    
  
   
    
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var credibleLabel2: UILabel!
    @IBOutlet weak var typeLabel2: UILabel!
    @IBOutlet weak var notesLabel2: UILabel!
    @IBOutlet weak var languageLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View didid load")
        isHeroEnabled=true
        nameLabel2.heroID="name"
        credibleLabel2.heroID="credible"
        typeLabel2.heroID="type"
        notesLabel2.heroID="notes"
        languageLabel2.heroID="label"

    }
    
    open func setup(name: String, credible:Bool, notes:String, type: String, language: String) {
        print("Hi3")
//        if name==""{nameLabel2.text="Empty"}        else {nameLabel2.text=name}
        //PROBLEM: Whenever a label.text is called, it return nil
        nameLabel2.text="HI!"
        print("Hi4")
        if type==""{typeLabel2.text="Empty"}        else {typeLabel2.text=type}

        print("Hi5")
        print(nameLabel2.text)

        print("Hi6")

        credibleLabel2.text="Credible"
        print("Hi7")

        if notes==""{notesLabel2.text="Empty"}        else {notesLabel2.text=notes}

        print("Hi8")

        print("Hi9")

        languageLabel2.text=language
        print("Hi10")

    }
}
