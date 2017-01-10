//
//  ViewController.swift
//  testFirebaseStringPusher4
//
//  Created by Luke Mann on 12/10/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit
import SwiftSpinner
import Firebase
//PROBLEM: NEW ENTRIES START AT BOTTOM, NOT AT TOP ENTRY 
class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var count:Int=0
    @IBOutlet weak var phraseLabel: UILabel!
    var isDoneUpdating=true
    var ref: FIRDatabaseReference!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        ref = FIRDatabase.database().reference()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //PROBLEM: getNumverDataCount returns zero
    @IBAction func buttonPressed(_ sender: Any) {
        //        print(textField.text)
        updateCount()
        let newRef = ref.child("messages").child("\(count+1)")
        print(count)
        newRef.child("phrase").setValue(textField.text)
        newRef.child("author").setValue("Luke")
        newRef.child("location").setValue("Ellicott City, MD")
        incrementCounterToFirebase()
        getMessage()
        
        
    }
    
    func getMessage(){
        let randomNumber = arc4random_uniform(UInt32(count)  ) ;
        //The reference to your questions in firebase (this is an example from firebase itself)
        //Order the questions on their value and get the one that has the random value
        ref.child("messages").child("\(randomNumber)").observe(.value, with: { snapshot in
            //            print(snapshot)
            self.phraseLabel.text=snapshot.childSnapshot(forPath: "phrase").value as! String
            self.nameLabel.text=snapshot.childSnapshot(forPath: "author").value as! String
            self.locationLabel.text=snapshot.childSnapshot(forPath: "location").value as! String

        })
        
        //        return nil
    }
    
    func updateCount()  {
        ref.child("messages").child("value").observe(.value, with: { snapshot in
            //            print(snapshot)
            let count=snapshot.value as! Int
               SwiftSpinner.show("Loading")
            self.count=count

            SwiftSpinner.hide() 
        })
    }
    
    
    func incrementCounterToFirebase(){
        let votesCountRef = ref.child("messages").child("value")
        votesCountRef.runTransactionBlock( { (currentData) -> FIRTransactionResult in
            let value = currentData.value as? Int ?? 0
            currentData.value = value + 1
            //            print(currentData.value)
            return FIRTransactionResult.success(withValue: currentData)
        })
    }
    
    
    
    
    
    
}

