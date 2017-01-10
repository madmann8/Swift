//
//  ViewController.swift
//  InteractiveStrory
//
//  Created by Luke Mann on 10/29/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    var currentPage:Page?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Changes Navigation Bar Color
        navigationController?.navigationBar.barTintColor = UIColor(hue: 29/360, saturation: 89/100, brightness: 92/100, alpha: 1.0) /* #ea7e19 */
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Sets up story view before animation executes
        if (segue.identifier == "startAdventure"){
            if let pageController = segue.destination as? PageController{
                pageController.page = Adventure.story
            }
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.1765, green: 0.2, blue: 0.1843, alpha: 1.0)
        }
    }
    

}
