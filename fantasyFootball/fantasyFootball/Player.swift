//
//  Player.swift
//  fantasyFootball
//
//  Created by Luke Mann on 10/30/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import Foundation


class Player {
    var weekOneScore: Int = 0
    
    var name: String = ""
    
    init(name:String,score:Int){
        self.name=name
        self.weekOneScore=score
    }
    
}
