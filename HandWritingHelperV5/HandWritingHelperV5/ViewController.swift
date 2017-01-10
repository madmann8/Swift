//
//  ViewController.swift
//  HandWritingHelperV5
//
//  Created by Luke Mann on 11/23/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        let length=23
        var attempt:String
        var sortedWords:[String]=[]
        //        let dictionary=Lexicontext.sharedDictionary()
        init(inAttempt:String) {
            attempt=inAttempt
            updateValues()
        }
        func isReal(word: String) -> Bool {
for realWord in allWords{
if realWord.hasPrefix(word){
return true
}

        }
        
        mutating func updateValues() {
            let xs = (0..<26).map({Character(UnicodeScalar("a".unicodeScalars.first!.value + $0)!)})
            var input:String = attempt.lowercased()
            var tempWords:[String]=[]
            tempWords.append(input)
            for i in input.characters.count ... length{
                for tempWord in tempWords{
                    for char in "abcdefghijklmnopqrstuvwxyz".characters.map(({String($0)})) {
                        let attempWord=tempWord+char
                        if (isReal(word: attempWord)){
                            tempWords.append(attempWord)
                            tempWords = tempWords.filter{$0 != tempWord}
                        }
                    }
                }
            }
            print(tempWords)
            sortedWords=tempWords
            
        }
        
        
        
        
        
        
        
        //                print("Words with prefix \'\(word)\' are: \n\n\(words)\n\n")
        
        public func getFirstSuggestion() -> String?{
            if let foo:String?=sortedWords[0] as String??{
                return foo
            }
            else{
                return ""
            }
        }
        
        func getSecondSuggestion() -> String?{
            if let foo:String?=sortedWords[1] as! String??{
                return foo
            }
            else{
                return ""
            }
        }
        
        func getThirdSuggestion() -> String?{
            if let foo:String?=sortedWords[2] as! String??{
                return foo
            }
            else{
                return ""
            }
        }
        
        func getFourthSuggestion() -> String?{
            if let foo:String?=sortedWords[3] as! String??{
                return foo
            }
            else{
                return ""
            }
        }
        
        func getFifthSuggestion() -> String?{
            if let foo:String?=sortedWords[4] as! String??{
                return foo
            }
            else{
                return ""
            }
        }
        
        func getSixthSuggestion() -> String?{
            if let foo:String?=sortedWords[5] as! String??{
                return foo
            }
            else{
                return ""
            }
        }
        
        func getSeventhSuggestion() -> String?{
            if let foo:String?=sortedWords[6] as! String??{
                return foo
            }
            else{
                return ""
            }
        }
        
        func getEigthSuggestion() -> String?{
            if let foo:String?=sortedWords[7] as! String??{
                return foo
            }
            else{
                return ""
            }
        }
        
        func getNinthSuggestion() -> String?{
            if let foo:String?=sortedWords[8] as! String??{
                return foo
            }
            else{
                return ""
            }
        }
    }
    
    @IBAction func editingChanged(_ sender: Any) {
        if (textBox.text?.characters.count)!>2{
            let dictionary=Dictionary(inAttempt: textBox.text!)
            suggestion1.text=dictionary.getFirstSuggestion()
//            suggestion2.text=dictionary.getSecondSuggestion()
//             suggestion3.text=dictionary.getThirdSuggestion()
//            suggestion4.text=dictionary.getFourthSuggestion()
//            suggestion5.text=dictionary.getFifthSuggestion()
//            suggestion6.text=dictionary.getSixthSuggestion()
//            suggestion7.text=dictionary.getSeventhSuggestion()
//            suggestion8.text=dictionary.getEigthSuggestion()
//            suggestion9.text=dictionary.getNinthSuggestion()
        }
        
    }
}
