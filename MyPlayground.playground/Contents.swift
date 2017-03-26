//: Playground - noun: a place where people can play

import UIKit

func hexStringtoAscii(_ hexString : String) -> [String] {
    
    let pattern = "(0x)?([0-9a-f]{2})"
    let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    let nsString = hexString as NSString
    let matches = regex.matches(in: hexString, options: [], range: NSMakeRange(0, nsString.length))

    let characters = matches.map {
        String(Character(UnicodeScalar(UInt32(nsString.substring(with: $0.rangeAt(2)), radix: 16)!)!))
    }
    return characters
}

let key1="0x4f 0x75 0x74 0x54 0x6f 0x44 0x61 0x76 0x65"
let pw1="0x21 0x46 0x00 0x23 0x5f 0x36 0x0a 0x45 0x01"

let key=hexStringtoAscii(key1)
let pw=hexStringtoAscii(pw1)


for i in 0...pw.count {
    let k=key[i%key.count]
    let p=pw[i]
    let m=pow((k as NSString).doubleValue, (p as NSString).doubleValue)
    print("\(m)")
    
    
}

