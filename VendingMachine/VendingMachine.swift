//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Luke Mann on 10/15/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import UIKit

// Protocols

protocol VendingMachineType {
    var selection: [VendingSelection]{ get }
    var inventory: [VendingSelection: ItemType]{ get set}
    var amountDepositied: Double { get set }
    
    init(inventory: [VendingSelection:ItemType])
    func vend(selection: VendingSelection, quantity: Double) throws
    func deposit (amount: Double)
        func itemFotCurrentSelection(selection: VendingSelection) -> ItemType?
    
}

protocol ItemType {
    var price: Double { get }
    var quantity: Double{ get set }
}

//ErrorTypes

enum InventoryError:Error {
    case InvalidResource
    case ConversionError
    case InvalidKey
}

enum VendingMachineError: Error {
    case InvalidSelection
    case OutofStock
    case InsufficentFUnd (funds: Double)
}

//Helper Classes

class PlistConverter {
    class func dictionaryFromFile(resource: String, ofType type : String) throws -> [String : AnyObject]{
        guard let path = Bundle.main.path(forResource: resource, ofType: type) else {
            throw InventoryError.InvalidResource
        }
        
        guard let dictionary = NSDictionary(contentsOfFile: path),
        let castDictionary = dictionary as? [String:AnyObject] else {
            throw InventoryError.ConversionError
        }

        return castDictionary
        
    }
}

class InventoryUnarchiver{
    class func vendingInventoryFromDictionary(dictionary: [String:AnyObject]) throws -> [VendingSelection : ItemType]{
        var inventory: [VendingSelection:ItemType] = [:]
        for (key,value) in dictionary {
            if let itemDict = value as? [String: Double], let price = itemDict["price"], let quantity = itemDict["quantity"]{
                let item = VendingItem(price: price, quantity: quantity)
                
                guard let key = VendingSelection(rawValue:key) else {
                    throw InventoryError.InvalidKey
                }
                inventory.updateValue(item, forKey: key)
            }
        }
        return inventory

    }
}

    // Concrete Types
    
enum VendingSelection:String {
        case Soda
        case DietSoda
        case Chips
        case Cookie
        case Sandwich
        case Wrap
        case CandyBar
        case PopTart
        case Water
        case FruitJuice
        case SportsDrink
        case Gum
    
    func icon() -> UIImage{
        
        if let image=UIImage(named: self.rawValue){
            return image
        }
        else {
            return UIImage(named: "Default")!
        }
    }
    }

    struct VendingItem:ItemType {
        var price: Double
        var quantity: Double
    }
    
    class VendingMachine:VendingMachineType{
        
        func itemFotCurrentSelection(selection: VendingSelection) -> ItemType? {
            return inventory[selection]
        }

        
        func deposit(amount: Double) {
        amountDepositied=amountDepositied+amount
            
        }
        func vend(selection: VendingSelection, quantity: Double) throws {
            guard var item = inventory[selection] else {
                throw VendingMachineError.InvalidSelection
            }
            
            guard item.quantity>0 else {
                throw VendingMachineError.OutofStock
            }
            
            item.quantity -= quantity
            let totalPrice = item.price * quantity
            
            inventory.updateValue(item, forKey: selection)
            if amountDepositied >= totalPrice {
                amountDepositied -= totalPrice
            }
            else {
                let amountRequired = totalPrice-amountDepositied
                throw VendingMachineError.InsufficentFUnd(funds: amountRequired)
            }
        }
        
        
        var amountDepositied: Double = 10.0
        
        
        var inventory: [VendingSelection : ItemType]
        
        var selection: [VendingSelection] = [.Soda, .DietSoda, .Chips, .Cookie, .Sandwich, .Wrap, .CandyBar, .PopTart, .Water, .FruitJuice, .SportsDrink, .Gum]
        
        required init(inventory: [VendingSelection : ItemType]) {
            self.inventory=inventory
        }
        
        
}
