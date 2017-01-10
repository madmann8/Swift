//////////: Playground - noun: a place where people can play
////////
////////import UIKit
////////
////////var str = "Hello, playground"
////////
////////
////////let values=[1,2,3,4,5342]
////////
////////var newArray=[Int]()
////////
////////let triplesValues = values.map {  $0 * 4  }
////////
////////
//////////Map
////////
////////
//////extension Array {
//////    func map<T>(transfrom: (Element)->T)->[T]{
//////        var result=[T]()
//////            for x in self {
//////                result.append(transfrom(x))
//////            }
//////        return result
//////    }
//////}
////////}
////////
//////let integerValues=["1","6879809","qweqwr","4"].map {  i in Int(i)  }
//////////
//////////
//////////
//////////integerValues
//////
////////
////////
////////
////////import Foundation
////////import UIKit
////////
////////struct Formatter {
////////    static let formatter = DateFormatter()
////////    
////////    static func dateFromString(dateString: String) -> NSDate? {
////////        formatter.dateFormat = "d MMM yyyy"
////////        return formatter.date(from: dateString) as NSDate?
////////    }
////////}
////////
////////let dateStrings = ["10 Oct 1988", "11 Jan 1947", "28 Mar 2002"]
////////
////////
////////let dates=dateStrings.map {  Formatter.dateFromString(dateString: $0)  }
////////
////////for date in dates {
////////    print (date)
////////}
////////
////////dates
////
////
////extension Array {
////    func map<T>(transfrom: (Element)->T)->[T]{
////        var result=[T]()
////        for x in self {
////            result.append(transfrom(x))
////        }
////        return result
////    }
////}
////
////let numbers = [1,2,3,4,5]
////
////let numberStrings=numbers.map({  String($0)  })
////////}
////////
//////let integerValues=["1","6879809","qweqwr","4"].map {  i in Int(i)  }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////struct Post {
////    var content: String
////    var tags: [String]
////}
////
////let blog = [
////    Post(content: "Hello, world!", tags: ["first", "programming"]),
////    Post(content: "Just another short post", tags: ["general"])
////]
////
////// Example 2
////
////import UIKit
////
////struct Account {
////    let username: String
////    let billingAddress: String?
////}
////
////
////let allUsers = [
////    Account(username: "pasanpr", billingAddress: nil),
////    Account(username: "benjakuben", billingAddress: "1234 Imaginary Street"),
////    Account(username: "instantNadel", billingAddress: "5678 Doesn't Live Here Dr."),
////    Account(username: "sketchings", billingAddress: nil),
////    Account(username: "paradoxed", billingAddress: "1122 Nope Lane")
////]
////
////
////blog.map { $0.content }
////
////
////
////
//
//
//
//let numbers = [[1,2,3], [4,5,6], [7,8,9]]
//
//let flattendedNumbers=numbers.flatMap{ $0  }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//


//
//
//
//
//
//let numbers = [10,423,802,765,943,12,405,230,1348,128,237]
//
//let oddValues=numbers.filter {  $0%2 != 0  }
//
//
//oddValues




let ages = [12,10,11,42,35,27,91,82,26,33,37,15]

let total=ages.reduce(0, {r,  i in r + i  })

total

