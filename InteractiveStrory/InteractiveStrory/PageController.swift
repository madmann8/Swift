//
//  PageController.swift
//  InteractiveStrory
//
//  Created by Luke Mann on 10/29/16.
//  Copyright © 2016 Luke Mann. All rights reserved.
//

import UIKit

class PageController: UIViewController {
    
    var page:Page?
    
    var delegate: UIPageViewControllerDelegate?
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBOutlet weak var pathOneButton: UIButton!
    init(page: Page, delegate: UIPageViewControllerDelegate){
        self.page=page
        self.delegate=delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setPage(page:Page){
        self.page=page
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonOne.layer.cornerRadius=10.0
        buttonTwo.layer.cornerRadius=10.0
        refresh()
        text.textColor=UIColor(red: 255/255, green: 216/255, blue: 217/255, alpha: 1.0) /* #ffd8d9 */
        self.view.backgroundColor=UIColor(red: 0.1765, green: 0.2, blue: 0.1843, alpha: 1.0) /* #2d332f */
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressButtonOne() {
        self.page=self.page?.firstChoice?.page
        refresh()
    }
    
    @IBAction func pressButtonTwo() {
        self.page=self.page?.secondChoice?.page
        refresh()
        
    }

    
    func refresh(){
        image.image=page?.story.image
        text.text=page?.story.text
        if (self.page?.firstChoice?.title==nil){
            buttonOne.isHidden=true
        }
        if (self.page?.secondChoice?.title==nil){
            buttonTwo.isHidden=true
        }
        buttonOne.setTitle(self.page?.firstChoice?.title, for: .normal)
        buttonTwo.setTitle(self.page?.secondChoice?.title, for: .normal)
        func blinkScreen(){
            if let currentView = self.view{
                var subView = UIView(frame: currentView.bounds)
                subView.backgroundColor = UIColor.red
                subView.alpha = 1
                
                currentView.addSubview(subView)
                UIView.animate(withDuration: 1, animations: {
                    subView.alpha = 0.0
                }, completion: {(finished:Bool) in
                    subView.removeFromSuperview()
                })
            }
        }
        if (self.page?.story.image==UIImage(named: "Death")){
            blinkScreen()
        }
    }
}
