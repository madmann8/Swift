//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func switcheroo<T> (inout a: T, inout b: T){
    let tempA = a
    a = b
    b = tempA
}

var five = 5
var ten = 10

switcheroo(&five, b: &ten)

five
ten

var fivePt = 5.5
var tenPt = 10.5

switcheroo(&fivePt, b: &tenPt)

fivePt
tenPt

