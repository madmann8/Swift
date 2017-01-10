//
//  ViewController.swift
//  Handwriting Helper
//
//  Created by Luke Mann on 11/18/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit




class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var suggestion1: UILabel!
    @IBOutlet weak var suggestion2: UILabel!
    @IBOutlet weak var suggestion3: UILabel!
    @IBOutlet weak var suggestion4: UILabel!
    @IBOutlet weak var suggestion5: UILabel!
    @IBOutlet weak var suggestion6: UILabel!
    @IBOutlet weak var suggestion7: UILabel!
    @IBOutlet weak var suggestion8: UILabel!
    @IBOutlet weak var suggestion9: UILabel!
      override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    struct Dictionary {
        var attempt:String
        var text:String
        var words: [String]
        var results:[String]
        var sortedWords:[String]=[]
        var dictionary:[String:Int]
        init(inAttempt:String) {
            
            attempt=inAttempt
//            let dictionary = Lexicontext.sharedDictionary()
//            let definition = dictionary.
            let path:String =  Bundle.main.path(forResource: "words", ofType: "txt")!
            text =  try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
            words  = text.components(separatedBy: ("\n"))
            results=[]
            dictionary=[:]
            updateValues()
        }

        func lettersInARow(attempt:String)-> Int{
            var count=0
            var input = text.characters.map { String($0) }
            let tryWord = attempt.characters.map { String($0) }
            if (input.count>tryWord.count+1){
                return 0
            }
            var continuedTrue:Bool=true
            for i in 0...input.count {
                if input[i]==tryWord[i] && continuedTrue{
                    count+=1
                }
                else {
                    continuedTrue=false
                }
            }
            return count
        }
        
        mutating func updateValues() {
            for word in words {
                self.dictionary[word]=lettersInARow(attempt: word)
            }
            var tempDictionary:[String:Int]=[:]
            for (k,v) in Array(self.dictionary).sorted(by: {$0.0 < $1.0}) {
                tempDictionary[k]=v
            }
            dictionary=tempDictionary
            let componentArray = [String] (dictionary.keys)
            self.sortedWords = componentArray
        }
        
        public func getFirstSuggestion() -> String?{
            if let foo:String?=sortedWords[sortedWords.count-1]{
                return foo
            }
            else{
                return nil
            }
        }
        
        func getSecondSuggestion() -> String?{
            if let foo:String?=sortedWords[sortedWords.count-2]{
                return foo
            }
            else{
                return nil
            }
        }
        
        func getThirdSuggestion() -> String?{
            if let foo:String?=sortedWords[sortedWords.count-3]{
                return foo
            }
            else{
                return nil
            }
        }
        
        func getFourthSuggestion() -> String?{
            if let foo:String?=sortedWords[sortedWords.count-4]{
                return foo
            }
            else{
                return nil
            }
        }
        
        func getFifthSuggestion() -> String?{
            if let foo:String?=sortedWords[sortedWords.count-5]{
                return foo
            }
            else{
                return nil
            }
        }
        
        func getSixthSuggestion() -> String?{
            if let foo:String?=sortedWords[sortedWords.count-6]{
                return foo
            }
            else{
                return nil
            }
        }
        
        func getSeventhSuggestion() -> String?{
            if let foo:String?=sortedWords[sortedWords.count-7]{
                return foo
            }
            else{
                return nil
            }
        }
        
        func getEigthSuggestion() -> String?{
            if let foo:String?=sortedWords[sortedWords.count-8]{
                return foo
            }
            else{
                return nil
            }
        }
        
        func getNinthSuggestion() -> String?{
            if let foo:String?=sortedWords[sortedWords.count-9]{
                return foo
            }
            else{
                return nil
            }
        }
    }
    
    @IBAction func valueChanges(_ sender: Any) {
        let dictionary=Dictionary(inAttempt: textBox.text!)
        suggestion1.text=dictionary.getFirstSuggestion()
        suggestion2.text=dictionary.getSecondSuggestion()
        suggestion3.text=dictionary.getThirdSuggestion()
        suggestion4.text=dictionary.getFourthSuggestion()
        suggestion5.text=dictionary.getFifthSuggestion()
        suggestion6.text=dictionary.getSixthSuggestion()
        suggestion7.text=dictionary.getSeventhSuggestion()
        suggestion8.text=dictionary.getEigthSuggestion()
        suggestion9.text=dictionary.getNinthSuggestion()
    }


}


