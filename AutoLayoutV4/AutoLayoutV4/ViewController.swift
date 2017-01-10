
import UIKit

class ViewController: UIViewController {
    
    let orangeView = UIView()
    let purpleView = UIView()
    let blueView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        orangeView.backgroundColor = UIColor(red: 255/255.0, green: 148/255.0, blue: 0/255.0, alpha: 1.0)
        view.addSubview(orangeView)
        
        purpleView.backgroundColor = UIColor(red: 204/255.0, green: 102/255.0, blue: 255/255.0, alpha: 1.0)
        view.addSubview(purpleView)
        
        blueView.backgroundColor = UIColor(red: 102/255.0, green: 204/255.0, blue: 255/255.0, alpha: 1.0)
        view.addSubview(blueView)
    }
    
    override func viewWillLayoutSubviews() {
        setupOrangeViewConstraints()
        setupPurpleViewConstraints()
        setupBlueViewConstraints()
        super.viewWillLayoutSubviews()
        sampleView.translatesAutoresizingMaskIntoConstraints = false
        let Height=NSLayoutConstraint(item: sampleView, attribute: .height, relatedBy: .equal, toItem:nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0)
        let Width=NSLayoutConstraint(item: sampleView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0)
        let CenterX=NSLayoutConstraint(item: sampleView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let CenterY=NSLayoutConstraint(item: sampleView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        view.addConstraints([Height,Width,CenterX,CenterY])
    }
    let sampleView = UIView()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupOrangeViewConstraints() {
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orangeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orangeView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50.0),
            orangeView.heightAnchor.constraint(equalToConstant: 57.0),
            orangeView.widthAnchor.constraint(equalToConstant: 200.0)
            ])
    }
    
    func setupPurpleViewConstraints() {
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        let purpleViewLeadingSpaceConstraint = NSLayoutConstraint(item: purpleView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 8.0)
        
        let purpleViewBottomSpaceConstraint = NSLayoutConstraint(item: purpleView, attribute: .bottom, relatedBy: .equal, toItem: orangeView, attribute: .top, multiplier: 1.0, constant: -8.0)
        
        let purpleViewTrailingSpaceConstraint = NSLayoutConstraint(item: purpleView, attribute: .trailing, relatedBy: .equal, toItem: blueView, attribute: .leading, multiplier: 1.0, constant: -8.0)
        
        let purpleViewTopSpaceConstraint = NSLayoutConstraint(item: purpleView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 8)
        
        view.addConstraints([
            purpleViewLeadingSpaceConstraint,
            purpleViewTopSpaceConstraint,
            purpleViewBottomSpaceConstraint,
            purpleViewTrailingSpaceConstraint
            ])
    }
    
    func setupBlueViewConstraints() {
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        let blueViewTopSpaceConstraint = NSLayoutConstraint(item: blueView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 8.0)
        let blueViewBottomSpaceConstraint = NSLayoutConstraint(item: blueView, attribute: .bottom, relatedBy: .equal, toItem: orangeView, attribute: .top, multiplier: 1.0, constant: -8.0)
        let blueViewTrailingSpaceConstraint = NSLayoutConstraint(item: blueView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: -8.0)
        let equalWidthConstraints = NSLayoutConstraint(item: blueView, attribute: .width, relatedBy: .equal, toItem: purpleView, attribute: .width, multiplier: 1.0, constant: 0.0)
        
        view.addConstraints([blueViewTopSpaceConstraint, blueViewBottomSpaceConstraint, blueViewTrailingSpaceConstraint, equalWidthConstraints])
    }
}































