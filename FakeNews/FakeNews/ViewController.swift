//
//  ViewController.swift
//  FakeNews
//
//  Created by Luke Mann on 1/10/17.
//  Copyright © 2017 Luke Mann. All rights reserved.
//
import UIKit
import SwiftyJSON
import RAMReel

class ViewController: UIViewController {
    
    var dataSource: SimplePrefixQueryDataSource!
    var ramReel: RAMReel<RAMCell, RAMTextField, SimplePrefixQueryDataSource>!
    var sources: [Source]=[]
    var titleData:[String]=[]
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var credibleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func viewDidLoad() {
        //TODO: REPEAT EVERYTHING WITH CREDIBLE SOURCES
        super.viewDidLoad()
        nameLabel.heroID="name"
        credibleLabel.heroID="credible"
        typeLabel.heroID="type"
        notesLabel.heroID="notes"
        languageLabel.heroID="label"
        isHeroEnabled=true
        let urlString = "https://raw.githubusercontent.com/BigMcLargeHuge/opensources/master/notCredible/notCredible.json"
        let credibleUrlString="https://raw.githubusercontent.com/BigMcLargeHuge/opensources/master/credible/credible.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                let json = JSON(data: data)
                getJSON(json: json)
                //                 print(json)
                
            }
        }
        if let url = URL(string: credibleUrlString) {
            if let data = try? Data(contentsOf: url) {
                let json = JSON(data: data)
                getJSONCredible(json: json)
                //                 print(json)
                
            }
        }

//        for name in titleData{
////            print(name)
//        }
 
        

        
//        ramReel.hooks.append {
//            let r = Array($0.characters.reversed())
//            let j = String(r)
////            print("Reversed:", j)
//        }
    
//        self.view.addSubview(ramReel.view)
//        ramReel.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    }
    
    
    
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

struct Source {
    var name: String?
    var language: String?
    var type: String?
    var notes: String?
    var credible: Bool?
    
    
    init?(language: String?, type: String?, notes: String?, name: String?, credible: Bool?){
        if language=="en"{
            self.language="English"
        }
        else    {self.language=language}
        self.type=type
        self.notes=notes
        self.name=name
        self.credible=credible
        
    }
    func test() {
        print("Name: \(self.name)")
        print("Language: \(self.language)")
        print("Type: \(self.type)")
        print("Notes: \(self.notes)")
        
    }
    
}

func getJSON(json: JSON) {
    for (index, object) in json {
        let name=index
        let language=object["language"].stringValue
        let notes=object["notes"].stringValue
        let types=object["notes"].stringValue
        sources.append(Source(language: language, type: types, notes: notes, name: name, credible: false)!)
        titleData.append(name)
    }
}
    func getJSONCredible(json: JSON) {
        for (index,object) in json {
            let name=object["url"].stringValue
            sources.append(Source(language: nil, type: nil, notes: nil, name: name, credible: true)!)
            titleData.append(name)
        }
    }
    func viewController(forStoryboardName:String) -> UIViewController{
        print("FOEDEDEOOO")
        return UIStoryboard(name: forStoryboardName, bundle: nil).instantiateInitialViewController()!
    }
}



