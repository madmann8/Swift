//: Playground - noun: a place where people can play

import UIKit

extension Int {
    func apply(value: Int, operation: (Int,Int) throws -> Int)  rethrows -> Int{
            return try operation(self,value)
 
    }
}

enum Probs:Error{
    case DivideByZero
}


try 10.apply(value: 0) { firstValue, secondValue in
    
    if secondValue==0 {
        throw Probs.DivideByZero
}
    else {
        return firstValue/secondValue
    }
}


