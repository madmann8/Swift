import UIKit

let kHandTypeEnabled = "kHandTypeEnabled"

@available(iOSApplicationExtension 10.0, *)
class Handboard: KeyboardViewController {
    
    let takeDebugScreenshot: Bool = false
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        UserDefaults.standard.register(defaults: [kHandTypeEnabled: true])
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func keyPressed(_ key: Key) {
        print("About to create UIImpactFeedbackGenerator")
        let generator = UIImpactFeedbackGenerator(style: .light)
        print("Generator created, about to call impactOccured")
        generator.impactOccurred()
        print("Done running impactOccured")

        let textDocumentProxy = self.textDocumentProxy
        
        let keyOutput = key.outputForCase(self.shiftState.uppercase())
        
        if !UserDefaults.standard.bool(forKey: kHandTypeEnabled) {
            textDocumentProxy.insertText(keyOutput)
            return
        }

        if key.type == .character || key.type == .specialCharacter {
            if let context = textDocumentProxy.documentContextBeforeInput {
                if context.characters.count < 2 {
                    textDocumentProxy.insertText(keyOutput)
                    return
                }
                
                var index = context.endIndex
                
                index = context.index(before: index)
                if context[index] != " " {
                    textDocumentProxy.insertText(keyOutput)
                    return
                }
                
                index = context.index(before: index)
                if context[index] == " " {
                    textDocumentProxy.insertText(keyOutput)
                    return
                }
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                print("HI")
                textDocumentProxy.insertText("\(getHand())")
                textDocumentProxy.insertText(keyOutput)
                return
            }
            else {
                textDocumentProxy.insertText(keyOutput)
                return
            }
        }
        else {
            textDocumentProxy.insertText(keyOutput)
            return
        }
        

    }
    
    override func setupKeys() {

        super.setupKeys()
        
        if takeDebugScreenshot {
            if self.layout == nil {
                return
            }
            
            for page in keyboard.pages {
                for rowKeys in page.rows {
                    for key in rowKeys {
                        if let keyView = self.layout!.viewForKey(key) {
                            keyView.addTarget(self, action: "takeScreenshotDelay", for: .touchDown)
                        }
                    }
                }
            }
        }
    }
    
    override func createBanner() -> ExtraView? {
        return HandboardBanner(globalColors: type(of: self).globalColors, darkMode: false, solidColorMode: self.solidColorMode())
    }
    
    func takeScreenshotDelay() {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(Handboard.takeScreenshot), userInfo: nil, repeats: false)
    }
    
    func takeScreenshot() {
        if !self.view.bounds.isEmpty {
            UIDevice.current.beginGeneratingDeviceOrientationNotifications()
            
            let oldViewColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor(hue: (216/360.0), saturation: 0.05, brightness: 0.86, alpha: 1)
            
            let rect = self.view.bounds
            UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
            var context = UIGraphicsGetCurrentContext()
            self.view.drawHierarchy(in: self.view.bounds, afterScreenUpdates: true)
            let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let name = (self.interfaceOrientation.isPortrait ? "Screenshot-Portrait" : "Screenshot-Landscape")
            let imagePath = "/Users/archagon/Documents/Programming/OSX/RussianPhoneticKeyboard/External/tasty-imitation-keyboard/\(name).png"
            
            if let pngRep = UIImagePNGRepresentation(capturedImage!) {
                try? pngRep.write(to: URL(fileURLWithPath: imagePath), options: [.atomic])
            }
            
            self.view.backgroundColor = oldViewColor
        }
    }
}

func getHand() -> String {
    return String("👏")
}
