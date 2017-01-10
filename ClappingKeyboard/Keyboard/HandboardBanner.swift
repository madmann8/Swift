import UIKit

class HandboardBanner: ExtraView {
    
    var handSwitch: UISwitch = UISwitch()
    var handLabel: UILabel = UILabel()
    
    required init(globalColors: GlobalColors.Type?, darkMode: Bool, solidColorMode: Bool) {
        super.init(globalColors: globalColors, darkMode: darkMode, solidColorMode: solidColorMode)
        
        self.addSubview(self.handSwitch)
        self.addSubview(self.handLabel)
        
        self.handSwitch.isOn = UserDefaults.standard.bool(forKey: kHandTypeEnabled)
        self.handSwitch.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        self.handSwitch.addTarget(self, action: #selector(HandboardBanner.respondToSwitch), for: UIControlEvents.valueChanged)
        
        self.updateAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.handSwitch.center = self.center
        self.handLabel.center = self.center
        self.handLabel.frame.origin = CGPoint(x: self.handSwitch.frame.origin.x + self.handSwitch.frame.width + 8, y: self.handLabel.frame.origin.y)
    }
    
    func respondToSwitch() {
        UserDefaults.standard.set(self.handSwitch.isOn, forKey: kHandTypeEnabled)
        self.updateAppearance()
    }
    
    func updateAppearance() {
        if #available(iOSApplicationExtension 10.0, *) {

//            let generator = UIImpactFeedbackGenerator(style: .medium)
//            generator.impactOccurred()

        } else {
            // Fallback on earlier versions
        }
        if self.handSwitch.isOn {
            self.handLabel.text = "👏"
            self.handLabel.alpha = 1
        }
        else {
            self.handLabel.text = "✋"
            self.handLabel.alpha = 0.5
        }
        
        self.handLabel.sizeToFit()
    }
}
