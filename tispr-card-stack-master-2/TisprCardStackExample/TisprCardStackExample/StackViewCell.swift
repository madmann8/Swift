/*
 Copyright 2015 BuddyHopp, Inc.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

//
//  TisprCardStackDemoViewCell.swift
//  TisprCardStack
//
//  Created by Andrei Pitsko on 7/12/15.
//

import UIKit
import TisprCardStack

class TisprCardStackDemoViewCell: TisprCardStackViewCell , InformingDelegate {
    var speechTimer = Timer()
    var speechTimerCounter = 81
    var speechTimerisPaused=true
    var opponentTimer = Timer()
    var selfTimer = Timer()
    var opponentTimerisPaused=true
    var selfTimerisPaused=true
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var showPrep=false
    var showReset=false
    
    
        var secondVC : TisprCardStackDemoViewController = TisprCardStackDemoViewController()
    
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var selfPrepButton: UIButton!
    @IBOutlet weak var opponentPrepButton: UIButton!
    @IBOutlet weak var speechButton: UIButton!
    @IBOutlet weak var text: UILabel!
    
    override func awakeFromNib() {
        print("New card loaded ebign")

        super.awakeFromNib()

      
        //        print("Hi2")

            //            print(opponentTimerCounter)
        
        
        //        opponentTimerCounter=UserDefaults.value(forKey: "prep") as! Int
        updateSpeechButtonTitle()
        updateOpponentPrepButtonTitle()
        updateSelfPrepButtonTitle()

        //        print("Hi4")
                secondVC.delegate = self
        //        print("Hi6")
        layer.cornerRadius = 12
        clipsToBounds = false
        //        print("Hi3")
        
        //        opponentTimerCounter=UserDefaults.value(forKey: "opponentPrep") as! Int



        
        
    }

    override var center: CGPoint {
        didSet {
        }
    }
    
    override internal func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
    }
    
    @IBAction func selfPrepButtonPressed(_ sender: Any) {
        if selfTimerisPaused {
            updateSpeechButtonTitle()
            selfTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(TisprCardStackDemoViewCell.selfPrepUpdate), userInfo: nil, repeats: true)
            selfTimerisPaused=false
        }
        else {
            selfTimer.invalidate()
            selfTimerisPaused=true
            updateSpeechButtonTitle()
        }

    }
    
    
    @IBAction func opponentPrepButtonPressed() {
        if opponentTimerisPaused {
            opponentTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(TisprCardStackDemoViewCell.opponentPrepUpdate), userInfo: nil, repeats: true)
            opponentTimerisPaused=false
        }
        else {
            opponentTimer.invalidate()
            opponentTimerisPaused=true
            updateOpponentPrepButtonTitle()        }
    }
    
    
    
    @IBAction func speechButtonPredded(_ sender: Any) {
        if speechTimerisPaused {
            speechTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(TisprCardStackDemoViewCell.speechUpdate), userInfo: nil, repeats: true)
            speechTimerisPaused=false
        }
        else {
            speechTimer.invalidate()
            speechTimerisPaused=true
            updateSpeechButtonTitle()        }
    }
    
    func speechUpdate() {
        speechTimerCounter-=1
        updateSpeechButtonTitle()
    }
    func opponentPrepUpdate() {
        appDelegate.opponentPrep-=1
//        print("Here2")
        updateOpponentPrepButtonTitle()
    }
    
    func selfPrepUpdate() {
        appDelegate.selfPrep-=1
        //        print("Here2")
        updateSelfPrepButtonTitle()
    }
    

    
    func updateSpeechButtonTitle(){
        let minutes = Int(speechTimerCounter) / 600 % 60
        let seconds = abs(Int(speechTimerCounter) / 10 % 60)
        if speechTimerCounter<0 {
            self.speechButton.setTitle("-"+(String(format:"%2i:%02i", minutes, seconds))
                , for: .normal)
            self.speechButton.titleLabel?.textColor=UIColor.red
            
        }
        else {
            self.speechButton.setTitle(String(format:"%2i:%02i", minutes, seconds)
                , for: .normal)
            
        }
        
    }
    func updateOpponentPrepButtonTitle(){
        let num=appDelegate.opponentPrep
        let minutes = Int(num) / 600 % 60
        let seconds = abs(num) / 10 % 60
        if num<0 {
            self.opponentPrepButton.setTitle("-"+(String(format:"%2i:%02i", minutes, seconds))
                , for: .normal)
            self.opponentPrepButton.titleLabel?.textColor=UIColor.red
            
        }
        else {
            self.opponentPrepButton.setTitle(String(format:"%2i:%02i", minutes, seconds)
                , for: .normal)
            
        }
        
    }
    
    func updateSelfPrepButtonTitle(){
        let num=appDelegate.selfPrep
        let minutes = Int(num) / 600 % 60
        let seconds = abs(num) / 10 % 60
        if num<0 {
            self.selfPrepButton.setTitle("-"+(String(format:"%2i:%02i", minutes, seconds))
                , for: .normal)
            self.selfPrepButton.titleLabel?.textColor=UIColor.red
            
        }
        else {
            self.selfPrepButton.setTitle(String(format:"%2i:%02i", minutes, seconds)
                , for: .normal)
            
        }
        
    }
    
    func updateShownTimers() {
        if showReset==true{
        print("HIHEFIEHUIGBIYWTBFYUWTEBFIUYEITUFIUWYFTBIEWBYTFNWEFTIUWB")
        selfPrepButton.isHidden=true
        selfPrepButton.isEnabled=false
        opponentPrepButton.isHidden=true
        opponentPrepButton.isEnabled=false
        speechButton.isHidden=true
        speechButton.isEnabled=true
            resetButton.isHidden=false
            resetButton.isEnabled=true

        }

        else if showPrep==true && showReset==false{
            print("AIHEFIEHUIGBIYWTBFYUWTEBFIUYEITUFIUWYFTBIEWBYTFNWEFTIUWB")

            selfPrepButton.isHidden=false
            selfPrepButton.isEnabled=true
            opponentPrepButton.isHidden=false
            selfPrepButton.isEnabled=true
            speechButton.isHidden=true
            speechButton.isEnabled=false
        }
        else if showPrep==false && showReset==false {
            print("BIHEFIEHUIGBIYWTBFYUWTEBFIUYEITUFIUWYFTBIEWBYTFNWEFTIUWB")
            selfPrepButton.isHidden=true
            selfPrepButton.isEnabled=false
            opponentPrepButton.isHidden=true
            opponentPrepButton.isEnabled=false
            speechButton.isHidden=false
            speechButton.isEnabled=true
            
        }
        

    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        print("Here2")
        secondVC.reset()
    }
    //    func opponentValueChanged() -> Int {
    ////        print("IN function")
    //        return Int(opponentTimerCounter)
    //        // which is 5 in your case (value taken from a question)
    //    }
}




