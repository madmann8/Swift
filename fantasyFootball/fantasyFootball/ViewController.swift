//
//  ViewController.swift
//  fantasyFootball
//
//  Created by Luke Mann on 10/30/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit

//protocol LeagueModelDelegate {
//    func getPlayers() -> [Player]
//    func addPlayer(tempPlayer: Player)
//    func addScore(tempPlayer: Player, score:Int)
//}

class ViewController: UIViewController, LeagueModelDelegate  {


    override func viewDidLoad() {
        super.viewDidLoad()
        AddScoresViewController.init(delegate: self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }


}

