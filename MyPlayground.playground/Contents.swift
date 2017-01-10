//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Tag {
    let name: String
}

struct Post {
    let author:String
    let title : String
    let tag : Tag
    
    func description() ->String{
        return ("\(title) by \(author). Filed under \(tag)")
    }
}
let tagw:Tag=Tag(name: "Foo")
let firstPost:Post=Post(author: "Hello", title: "Swag" ,tag:tagw)

let postDescription:String = firstPost.description()
