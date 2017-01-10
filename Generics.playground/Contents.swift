//: Playground - noun: a place where people can play

import UIKit

func switcheroo ( a: inout Int, b:inout Int){
    let tempA = a
    a=b
    b=tempA
}


var five=5
var ten=10

switcheroo(a: &five, b: &ten)

var tenPt=10.5
var fivePt=5.5

//switcheroo(a: &fivePt, b: &tenPt)


class Transactiont
