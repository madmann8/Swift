//: Playground - noun: a place where people can play

import UIKit

import UIKit

class Team {
    
    var name: String
    var city: String
    var winPCT: Double = 0.0
    
    init(name: String, city: String){
        self.name = name
        self.city = city
    }
}

class CurlingTeam : Team {
    
}

class BobsledTeam : Team {
    
}

func getLarger <T: Comparable> (valueA: T, valueB: T) -> T{
    if valueA > valueB{
        return valueA
    }
    else{
        return valueB
    }
}

let result = getLarger(13.8, valueB: 6)



func teamBlurb <T: Team> (team: T) -> String{
    return "\(team.name) of \(team.city) has a winning percentage of \(team.winPCT)"
}






protocol Person {
    var name: String {get}
    var hometown: String {get}
    var height: Double {get}
}

struct Coach : Person {
    var name: String
    var hometown: String
    var height: Double
}


struct Player : Person{
    
    var name: String
    var height: Double
    var hometown: String
    
    init(name: String, height: Double, hometown: String){
        self.name = name
        self.height = height
        self.hometown = hometown
    }
}

let testCoach = Coach(name: "Billy Martin", hometown: "Berkeley, CA", height: 68)
let testPlayer = Player(name: "Ricky Henderson", height: 72, hometown: "Chicago, IL")


func getPersonalInfo <T: Person> (person: T) -> String{
    return "You have selected \(person.name) from \(person.hometown)"
}

var info = getPersonalInfo(testPlayer)
var inf2 = getPersonalInfo(testCoach)
























class StatGroup<Element>{
    
    var members : Array<Element>
    var title: String
    
    init(title: String, members:[Element]){
        self.title = title
        self.members = members
    }
}






