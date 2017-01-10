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
    case Starting
    case Enter
    case ContinueTrickOrTreating
    case Upstairs
    case LivingRoom
    case Closet
    case Ghost
    case Bowl
    case Home
    case AttackGhost
    case ClownAttack
    case FallIntoPond
}

extension  Story {
    var image:UIImage{
        switch self {
        case .FallIntoPond,.ClownAttack,.AttackGhost,.Ghost,.Home, .Bowl :
            return UIImage(named: "Death")!
        default :
            return UIImage(named: "Home")!

            
        }
    }
    
    var text: String {
        switch self {
        case .Starting:
            return "You are out Trick or Treating, and you see an adbandond house nearby, do you enter the house?"
        case .Enter:
            return "You enter the house, it is dead silent with the exception of boards creaking upstairs. Do you go upstairs or explore downstairs?"
        case .ContinueTrickOrTreating:
            return "You continue trick or treating, upon heading back to your house you see the adbandond house again. Do you continue home or grow a pair and go into the house?"
        case .Upstairs:
            return "You go upstairs, all of the doors are locked except for one. You enter the room silently and see that nobody is there. The room is empty with the exception of a closet in the corner. Do you explore the closet or go back downstairs?"
        case .LivingRoom:
            return "You enter the living room, it is entirly empty with the excpetion of a wooden table with a bowl of candy on it. Do you take the candy or walk home?"
        case .Closet:
            return "You open the closet and to your suprise, a ghost rises out of the hanging clothes. In a panic, you must decide how to react. Do you run back downstairs or jump out the nearby window?"
        case .Ghost:
            return "You jump out of the near by window. You fall to your death. "
        case .Bowl:
            return "You eat the candy, it is delicious. After eating the entire bowl you head home. However, you never make it home as you die from the poisoned candy."
        case .Home:
            return "On you way home you get struck by lightning. You die."
        case .AttackGhost:
            return "You attempt to tackle the ghost. You fall through him and hit your head on a steel tipped boot in the closet. You die."
        case .ClownAttack:
            return "You turn around and walk into a clown. It hugs you to death"
        case .FallIntoPond:
            return "You are walking into the house when you fall into a pond and drown."
        }
    }
}

class Page {

    init (story:Story){
        self.story=story
    }

    let story: Story
    
    typealias Choice = (title: String, page: Page)
    
    var firstChoice: Choice?
    var secondChoice: Choice?
    
    func addChoice(title: String, story: Story) -> Page{
        let page = Page(story: story)
        addChoice(title: title, page: page)
        return page
    }
    
    func addChoice (title: String, page:Page)-> Page{
        if firstChoice == nil || secondChoice == nil {
            if (self.firstChoice==nil) {
                self.firstChoice = (title,page)
            }
            else {
                self.secondChoice = (title, page )
            }
        }
        
        return page
    }
    
    func getChoice()->Story {
        return self.story
    }
}


struct Adventure {
    static var story: Page {
        let Starting = Page(story: .Starting)
        let Enter = Starting.addChoice(title: "Enter the house", story: .Enter)
        
        let ContinueTrickOrTreating = Starting.addChoice(title: "Move on to the next house", story: .ContinueTrickOrTreating)

        let Upstairs = Enter.addChoice(title: "Go upstairs", story: .Upstairs)
        
        Upstairs.addChoice(title: "Go back downstairs", story: .ClownAttack)
        
        let Closet = Upstairs.addChoice(title: "Open the closet", story: .Closet)
        
        ContinueTrickOrTreating.addChoice(title:"Enter the house", story: .FallIntoPond)
        
        let home = ContinueTrickOrTreating.addChoice(title: "Continue back to your house", story: .Home)
        
        let LivingRoom = Enter.addChoice(title:"Explore the living room", story: .LivingRoom)
        
        LivingRoom.addChoice(title:"Eat from the bowl", story: .Bowl)
        
        LivingRoom.addChoice(title:"Go home", story: .Home)
        
        Closet.addChoice(title:"Jump out the window", story: .Ghost)
        
        Closet.addChoice(title:"Attack the ghost", story: .AttackGhost)
        
        LivingRoom.addChoice(title:"Eat from the bowl", story: .Bowl)
        
        LivingRoom.addChoice(title:"Go home", story: .Home)
        return Starting
    }
    
}



































