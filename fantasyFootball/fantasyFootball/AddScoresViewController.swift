//
//  AddScoresViewController.swift
//  fantasyFootball
//
//  Created by Luke Mann on 10/30/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit


//
//protocol LeagueModelDelegate {
//    func getPlayers() -> [Player]
//    func addPlayer(tempPlayer: Player)
//    func addScore(tempPlayer: Player, score:Int)
//}

class AddScoresViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return pickerData.count
        return 1
    }
    @IBOutlet weak var spinner: UIPickerView!
    @IBOutlet weak var scoreBox: UITextField!
    
    
    let pickerData : [String]
    
    override func viewDidLoad() {

        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        spinner.dataSource=self
        spinner.delegate=self
    }
    
    

    func assignData() {
        League.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        .text = pickerData[row]
    }
    
    
    
    
    
    
}
