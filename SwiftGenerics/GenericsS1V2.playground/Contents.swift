import UIKit

//class Team {
//    
//    var name: String
//    var city: String
//    var winPCT: Double=0.0
//    
//    init(name:String, city:String) {
//        self.name=name
//        self.city=city
//        
//    }
//}
//
//
//class CurlingTeam:Team {
//    
//}
//
//class BobsledTeam:Team{
//    
//}
//
//func teamBlurb <T: Team> (team:T)->String{
//    return "\(team.name) of \(team.city) has a winning percentage of \(team.winPCT)%"
//}




































protocol Person {
    var name: String { get }
    var hometown:String{ get }
    var height: Double{ get }
    
    associatedtype PositionType
    var positions: PositionType {get}
    
}




struct Coach: Person{
    typealias PositionType = String
    var positions: PositionType
    var name: String
    var hometown: String
    var height: Double
}



struct Player: Person{
    typealias PositionType = Array<String>
    var positions: PositionType
    var name: String
    var height: Double
    var hometown: String
    

    
    init(name:String,height: Double,hometown:String,positions:PositionType) {
        self.name=name
        self.height=height
        self.hometown=hometown
        self.positions=positions
    }

    
}

var newPlayer=Player(name: "Jim", height: 66, hometown: "Boston,MA", positions: ["15","6","23"])

var newCoach = Coach(positions: "Head Coach", name: "Billy", hometown: "Newton,MA", height: 76)

struct Executive {
    var name:String
    var hometown:String
    var height: Double
    
    var positions:String
}

extension Executive:Person{
    
}

func allItemsMatch <P1:Person,P2: Person>(p1:P1,p2:P2)->Bool where P1.PositionType == P2.PositionType{
    
    //sample response
    return true
}

//Works
allItemsMatch(p1: newCoach, p2: newCoach)

//Doesnt Work
    //allItemsMatch(p1: newCoach, p2: newPlayer)





/**************************************************|*******/



typealias IntegerFunction = (Int)-> String


func gameCounter() -> IntegerFunction{
    var counter=0
    func increment (i:Int)->String{
        counter+=i
        return String(counter)
    }
    return increment
}

let aCounter=gameCounter()

for x in 1...300{
    print ("\(x),\(aCounter(x*x/2131*213))")
}



let numbers = [1,2,3,4,5]


let tripledNumbers=numbers.map({(i:Int) ->Int in return i*3})

numbers.map() { $0 * 3 }

/******************************************/


func doubleValue(i: Int) -> Int {
    return i * 2
}

let doubler = doubleValue
let doubledValues = [1,2,3,4].map { $0 * 2 }



















//let testCoach=Coach(name: "Billy Martin", hometown: "Berkely, CA", height: 68)
//let testPlayer = Player(name: "Ricky Henderson", height: 72, hometown: "Chicago,IL")
//
//func getPersonalInfo <T: Person> (person:T)->String{
//    return "\(person.name) from \(person.hometown) with a height of \(person.height) inches."
//}
//
//print (getPersonalInfo(person: testCoach))
//
//
//
//
//
//

























































//class StatGroup<Element> {
//    
//    var members:Array<Element>
//    var title: String
//    
//    init(title:String, members: [Element]) {
//        self.title=title
//        self.members=members
//    }
//}
//
//var blazer=Team(name: "Blazers", city: "Portland")
//var nuggets=Team(name: "Nuggets", city: "Denver")
//
//var hoopsUS=StatGroup(title: "NBA West", members: [blazer,nuggets])
//
//hoopsUS.members
//
////
////var star=Player(name: "Pasan", height: 88.937872)
////var benchwarmer=Player(name: "Bench Warmer", height: 129.231)
//
//var iceFencingUS=StatGroup(title: "Olympic Ice Fencing", members: [star,benchwarmer])
//
//



