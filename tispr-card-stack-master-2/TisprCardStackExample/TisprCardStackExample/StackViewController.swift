protocol InformingDelegate {
//    func opponentValueChanged() -> Int
}


import TisprCardStack
import UIKit

class TisprCardStackDemoViewController: TisprCardStackViewController, TisprCardStackViewControllerDelegate {
    
    var selfCell: TisprCardStackDemoViewCell?
    
    var secondVC : TisprCardStackViewLayout = TisprCardStackViewLayout()
    
    var delegate: InformingDelegate?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var speakingFirst: UISwitch!
    @IBOutlet weak var isPro: UISwitch!
    
    
    
    @IBOutlet weak var isProLabel: UIButton!
    @IBOutlet weak var speakingFirstLabel: UIButton!
    
    
       
    fileprivate var countOfCards: Int = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()

        speakingFirstLabel.titleLabel?.adjustsFontSizeToFitWidth
        if appDelegate.isProSwitch {
            isPro.setOn(true, animated: false)
        }
        else {
            isPro.setOn(false, animated: false)
        }
        if appDelegate.speakingFirstSwitch {
            speakingFirst.setOn(true, animated: false)
        }
        else {
            speakingFirst.setOn(false, animated: false)
        }
        
        print("Hiii")
        
        secondVC.delegate = self
        //        self.opponentPrepTimerConuter=secondVC.getOpponentPrepTime()
        print(isPro.isOn)
        //set animation speed
        setAnimationSpeed(0.85)
        
        //set size of cards
        let size = CGSize(width: view.bounds.width - 20, height: 2.1*view.bounds.height/3)
        setCardSize(size)
        
        cardStackDelegate = self
        
        //configuration of stacks
        layout.topStackMaximumSize = 4
        layout.bottomStackMaximumSize = 30
        layout.bottomStackCardHeight = 45
        updateAppearance()
    }
    
    //method to add new card
    @IBAction func addNewCards(_ sender: AnyObject) {
        countOfCards += 1
        newCardWasAdded()
    }
    
    
    override func numberOfCards() -> Int {
        return countOfCards
    }
    
    override func card(_ collectionView: UICollectionView, cardForItemAtIndexPath indexPath: IndexPath) -> TisprCardStackViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath) as! TisprCardStackDemoViewCell
        if ((isPro.isOn && speakingFirst.isOn) || (!isPro.isOn && !speakingFirst.isOn)){
            switch indexPath.item {
            case 0:
                cell.showReset=false
                cell.speechTimerCounter = 2400
                cell.text.text="Pro Opening"
                cell.backgroundColor =  UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
            case 1:
                cell.showPrep=true
               
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
            case 2:
                cell.speechTimerCounter = 2400
                cell.text.text="Con Opening"
                cell.backgroundColor=UIColor(red: 216/255, green: 68/255, blue: 0/255, alpha: 1.0) /* #d84400 */
            case 3:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
            case 4:
                cell.speechTimerCounter = 1800
                cell.text.text="1st Cross Fire"
                cell.backgroundColor=UIColor(red: 0/255, green: 105/255, blue: 226/255, alpha: 1.0) /* #0069e2 */
                
            case 5:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
            case 6:
                cell.speechTimerCounter = 2400
                cell.text.text="Pro Rebuttle"
                cell.backgroundColor =  UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
                
            case 7:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 8:
                cell.speechTimerCounter = 2400
                cell.text.text="Con Rebuttle"
                cell.backgroundColor=UIColor(red: 216/255, green: 68/255, blue: 0/255, alpha: 1.0) /* #d84400 */
            case 9:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 10:
                cell.speechTimerCounter = 1800
                cell.text.text="2nd Cross Fire"
                cell.backgroundColor=UIColor(red: 0/255, green: 105/255, blue: 226/255, alpha: 1.0) /* #0069e2 */
                
            case 11:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 12:
                cell.speechTimerCounter = 1200
                cell.text.text="Pro Summary"
                cell.backgroundColor =  UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
                
            case 13:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 14:
                cell.speechTimerCounter = 1200
                cell.text.text="Con Summary"
                cell.backgroundColor=UIColor(red: 216/255, green: 68/255, blue: 0/255, alpha: 1.0) /* #d84400 */
            case 15:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 16:
                cell.speechTimerCounter = 1800
                cell.text.text="Grand Cross Fire"
                cell.backgroundColor=UIColor(red: 0/255, green: 105/255, blue: 226/255, alpha: 1.0) /* #0069e2 */
                
            case 17:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 18:
                cell.speechTimerCounter = 1200
                cell.text.text="Pro Final Focus"
                cell.backgroundColor =  UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
                
            case 19:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 20:
                cell.speechTimerCounter = 1200
                cell.text.text="Con Final Focus"
                cell.backgroundColor=UIColor(red: 216/255, green: 68/255, blue: 0/255, alpha: 1.0) /* #d84400 */
            case 21:
                cell.backgroundColor=UIColor(red: 137/255, green: 0/255, blue: 206/255, alpha: 1.0) /* #8900ce */
                cell.showReset=true
                cell.text.text="You Survived!"
            default:
                cell.text.text="Foo"
                
            }
        }
        else {
            switch indexPath.item {
            case 2:
                cell.speechTimerCounter = 2400
                cell.text.text="Pro Opening"
                cell.backgroundColor =  UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
            case 1:
                cell.showPrep=true
                
                print("New card loaded end")
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
            case 0:
                cell.speechTimerCounter = 2400
                cell.text.text="Con Opening"
                cell.backgroundColor=UIColor(red: 216/255, green: 68/255, blue: 0/255, alpha: 1.0) /* #d84400 */
            case 3:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
            case 4:
                cell.speechTimerCounter = 1800
                cell.text.text="1st Cross Fire"
                cell.backgroundColor=UIColor(red: 0/255, green: 105/255, blue: 226/255, alpha: 1.0) /* #0069e2 */
                
            case 5:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
            case 8:
                cell.speechTimerCounter = 2400
                cell.text.text="Pro Rebuttle"
                cell.backgroundColor =  UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
                
            case 7:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 6:
                cell.speechTimerCounter = 2400
                cell.text.text="Con Rebuttle"
                cell.backgroundColor=UIColor(red: 216/255, green: 68/255, blue: 0/255, alpha: 1.0) /* #d84400 */
            case 9:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 10:
                cell.speechTimerCounter = 1800
                cell.text.text="2nd Cross Fire"
                cell.backgroundColor=UIColor(red: 0/255, green: 105/255, blue: 226/255, alpha: 1.0) /* #0069e2 */
                
            case 11:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 14:
                cell.speechTimerCounter = 1200
                cell.text.text="Pro Summary"
                cell.backgroundColor =  UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
                
            case 13:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 12:
                cell.speechTimerCounter = 1200
                cell.text.text="Con Summary"
                cell.backgroundColor=UIColor(red: 216/255, green: 68/255, blue: 0/255, alpha: 1.0) /* #d84400 */
            case 15:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 16:
                cell.speechTimerCounter = 1800
                cell.text.text="Grand Cross Fire"
                cell.backgroundColor=UIColor(red: 0/255, green: 105/255, blue: 226/255, alpha: 1.0) /* #0069e2 */
                
            case 17:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 20:
                cell.speechTimerCounter = 1200
                cell.text.text="Pro Final Focus"
                cell.backgroundColor =  UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
                
            case 19:
                cell.showPrep=true
                
                cell.speechTimerCounter = 1200
                cell.text.text="Prep"
                cell.backgroundColor=UIColor(red: 211/255, green: 190/255, blue: 0/255, alpha: 1.0) /* #d3be00 */
                
            case 18:
                cell.speechTimerCounter = 1200
                cell.text.text="Con Final Focus"
                cell.backgroundColor=UIColor(red: 216/255, green: 68/255, blue: 0/255, alpha: 1.0) /* #d84400 */
            case 21:
                cell.backgroundColor=UIColor(red: 137/255, green: 0/255, blue: 206/255, alpha: 1.0) /* #8900ce */
                cell.showReset=true
                cell.text.text="You Survived!"
            default:
                cell.text.text="Foo"
                
            }
        }
         cell.updateShownTimers()
        cell.updateSpeechButtonTitle()
        cell.updateOpponentPrepButtonTitle()
        
        return cell
        
    }
    
    @IBAction func moveUP(_ sender: AnyObject) {
        moveCardUp()
        
    }
    
    @IBAction func moveCardDown(_ sender: AnyObject) {
        moveCardDown()
    }
    
    func cardDidChangeState(_ cardIndex: Int) {
        
//        print("card with index - \(cardIndex) changed position")
    }
//    @IBAction func isSpeakingFirstSwitched() {
//        if speakingFirst.isOn {
//            appDelegate.speakingFirstSwitch=true
//        }
//        else {
//            appDelegate.speakingFirstSwitch=false
//        }
//        print("Hi2")
//        //        if !sender.isOn{
//        //            print("is on")
//        //        }
//        updateAppearance()
//        reset()
//
//       
//    }
//    
//    @IBAction func isProSwitched(_ sender: UISwitch) {
//        if isPro.isOn {
//            appDelegate.isProSwitch=true
//        }
//        else {
//            appDelegate.isProSwitch=false
//        }
//        reset()
//
//           }
//    
//    
//    func updateAppearance(sender:UISwitch) {
//        print(sender.isOn)
//        if sender.isOn {
//            self.navigationController?.navigationBar.backgroundColor=UIColor.green
//            isProLabel.titleLabel?.text="Pro"
//        }
//            
//        else {
//            self.navigationController?.navigationBar.backgroundColor=UIColor.red
//            
//            isProLabel.titleLabel?.text="Con"
//        }
//    }
    @IBAction func isProSwitched() {
        if isPro.isOn {
                        appDelegate.isProSwitch=true
                    }
                    else {
                        appDelegate.isProSwitch=false
                    }
                    reset()
            //
            //           }

    }
    
    @IBAction func speakingFirstSwitched() {
        if speakingFirst.isOn {
                        appDelegate.speakingFirstSwitch=true
                    }
                    else {
                        appDelegate.speakingFirstSwitch=false
                    }
//                    print("Hi2")
                    //        if !sender.isOn{
                    //            print("is on")
                    //        }
                    updateAppearance()
                    reset()

        
    }
    
    func updateAppearance() {
                if isPro.isOn {
                    self.navigationController?.navigationBar.backgroundColor=UIColor.green
                    isProLabel.titleLabel?.text="Pro"
                }
        
                else {
                    self.navigationController?.navigationBar.backgroundColor=UIColor.red
        
                    isProLabel.titleLabel?.text="Con"
                }
        
        if speakingFirst.isOn {
            self.navigationController?.navigationBar.backgroundColor=UIColor.green
            speakingFirstLabel.titleLabel?.text="First"
        }
            
        else {
            self.navigationController?.navigationBar.backgroundColor=UIColor.red
            
            speakingFirstLabel.titleLabel?.text="Sec."
        }
        
            }

    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        print("HERERERE")
        reset()
    }
 
    
    func reset() {
        appDelegate.reset()

    }
    
    //
    //    override func reset() {
    //        for _ in 0...24 {
    //        moveCardUp()
    //        }
    //        
    //    }
         //    func opponentPrepValueChanged() -> Int {
    ////        print("IN function")
    //        return Int(opponentPrepTimerConuter)
    //        // which is 5 in your case (value taken from a question)
    //    }
    
    
}
