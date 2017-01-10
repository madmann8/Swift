import UIKit

protocol Person {
    var name: String {get}
    var hometown: String  {get}
    var height: Double {get}
    
    associatedtype PositionType
    var positions: PositionType {get}
    
}

struct Player : Person{
    
    var name: String
    var hometown: String
    var height: Double
    typealias PositionType = Array<String>
    var positions: PositionType
    
    init(name: String, height: Double, hometown: String, positions: PositionType){
        self.name = name
        self.height = height
        self.hometown = hometown
        self.positions = positions
    }
}

struct Coach : Person {
    var name: String
    var hometown: String
    var height: Double
    
    typealias PositionType = String
    var positions: PositionType
    
}

var newPlayer = Player(name: "Jim", height: 66, hometown: "Boston, MA", positions: ["15", "6", "11"])

var newCoach = Coach(name: "Billy", hometown: "Newton, MA", height: 76, positions: "Head Coach")

struct Executive{
    var name: String
    var hometown: String
    var height: Double
    
    var positions: String
}

extension Executive: Person{
    
}



func allItemsMatch<P1: Person, P2: Person where P1.PositionType == P2.PositionType>(p1: P1, p2: P2)-> Bool{
    
    //sample response
    return true
}

allItemsMatch(newCoach, p2: newCoach)



















