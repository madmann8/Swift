//
//  League.swift
//  fantasyFootball
//
//  Created by Luke Mann on 10/30/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

//
//  InteractiveStory.swift
//  InteractiveStrory
//
//  Created by Luke Mann on 10/29/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import Foundation
import UIKit

enum Story: String {
   case BenHuntley
    
   case RomanJohnsonbaugh
    
   case BrendanHood
    
    case HammadBaqai
    
   case TimLee
    
   case    MarkAntico
    
   case    KevinHermstein
    
   case    WillDeitemeyer
    
     case  SahilRaina
    
    case   DavidGeorge
    
    case   JackKuamar
    
    case   NolanDyer
    
   case    JiSeok
    
  case     CalebYun
    
    case   LJSturm
    
   case    JackLiparini
    
   case    ThomasWilliamson
    
    
}

extension  Story {
    var score:Int{
        return self.rawValue.characters.count
    }
    
    var name: String {
        switch self {
        case .BenHuntley: return "Ben Huntley"
            
        case .RomanJohnsonbaugh: return "Roman Johnsonbaugh"
            
        case .BrendanHood:return "Brendan Hood"
            
        case .HammadBaqai:return "Hammad Baqui"
            
        case .TimLee:return "Tim Lee"
            
        case    .MarkAntico:return "Mark Antico"
            
        case    .KevinHermstein:return "Keven Hermstein"
        
        case    .WillDeitemeyer:return "Will Deitemyer"
            
        case  .SahilRaina:return "Sahil Raina"
            
        case   .DavidGeorge:return "David George"
            
        case   .JackKuamar:return "Jack Kumar"
            
        case   .NolanDyer:return "Nolan Dyer"
            
        case    .JiSeok:return "Ji Seok"
            
        case     .CalebYun:return "Caled Yoon"
            
        case   .LJSturm:return " LJ Sturm"
            
        case    .JackLiparini:return "Jack Liparini"
            
        case    .ThomasWilliamson:return "Thomas Williamson"
            
        }
    }
}

class League{
    func addScore(tempPlayer: Player, score:Int) {
        for i in 0...player.count-1 {
            if tempPlayer.name==player[i].name{
                player[i].weekOneScore=score
            }
        }
    }
    
    
    
    func addPlayer(tempPlayer: Player) {
        player.append(tempPlayer)
    }
    
    func getPlayers()-> [Player] {
        return player
    }
    
    var player = [Player] {
        forz
    }
}


//struct Adventure {
//    static var story: Page {
//        let returnTrip = Page(story: .ReturnTrip)
//        let touchDown = returnTrip.addChoice(title: "Stop and Investigate", story: .TouchDown)
//        let homeward = returnTrip.addChoice(title: "Continue home to Earth", story: .Homeward)
//        
//        let rover = touchDown.addChoice(title: "Explore the Rover", story: .Rover)
//        let crate = touchDown.addChoice(title: "Open the Crate", story: .Rover)
//        
//        homeward.addChoice(title:"Head back to Mars", story: .TouchDown)
//        let home = homeward.addChoice(title: "Continue Home to Earth", story: .Home)
//        
//        let cave = rover.addChoice(title:"Explore the Coordinates", story: .Cave)
//        rover.addChoice(title:"Return to Earth", page: home)
//        
//        cave.addChoice(title:"Continue towards faint light", story: .Droid)
//        cave.addChoice(title:"Refill the ship and explore the rover", page: rover)
//        
//        crate.addChoice(title:"Explore the Rover", page: rover)
//        crate.addChoice(title:"Use the key", story: .Monster)
//        
//        return returnTrip
//        
//    }
    
}



































