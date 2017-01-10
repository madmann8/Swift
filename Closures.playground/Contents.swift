//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func printString(aString: String){
    print("Printing the string passed in: \(aString)")
}


printString(aString: "Hi my name is Luke")


let someFunction:(String)->Void=printString

someFunction("Yo")


/*************************************************************/



func sum (a:Int, b:Int) -> Int {
    return a+b
}


let addTwoNumbers=sum

print(addTwoNumbers(1,2))

func displayString(a: (String) -> Void) {
    a("I'm a function inside a function!")
}


displayString(a: printString)


func addTwo(num:Int)->Int{
    return num+2
}

let addition=addTwo

let result=addition(2123)


/***********************************************************/

extension Int {
    func apply(operation:(Int)->Int)->Int{
        return operation(self)
    }
}

func double(value:Int)-> Int{
    return value*2
}

20.apply(operation: double)


func closestMultipleofSix(value:Int)->Int{
    for x in 1...100{
        let multiple=x*6
        
        if multiple-value<6&&multiple>value{
            return multiple
        }
        else if multiple==value{
            return value
        }
    }
    return 0
}

32.apply(operation: closestMultipleofSix)
2.apply(operation: closestMultipleofSix)
