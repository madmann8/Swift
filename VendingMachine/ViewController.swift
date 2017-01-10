//
//  ViewController.swift
//  VendingMachine
//
//  Created by Pasan Premaratne on 1/19/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//



import UIKit

// FIXME: Make Work
extension Double {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
extension Double {
    var extendValue: String {
        return String(format: "%.02f", self)
    }
}

private let reuseIdentifier = "vendingItem"
private let screenWidth = UIScreen.main.bounds.width

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!
    
    let vendingMachine: VendingMachineType
    var currentSelection: VendingSelection?
    var quantity: Double = 1.0
    
    required init?(coder aDecoder: NSCoder) {
        print("Hi")
        do {
            let dictionary = try PlistConverter.dictionaryFromFile(resource: "VendingInventory", ofType: "plist")
            let inventiry = try InventoryUnarchiver.vendingInventoryFromDictionary(dictionary: dictionary)
            self.vendingMachine=VendingMachine(inventory: inventiry)
                
        } catch let error {
            fatalError("\(error)")
        }
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
               // Do any additional setup after loading the view, typically from a nib.
        setupCollectionViewCells()
        balanceLabel.text = "$\(vendingMachine.amountDepositied.extendValue)"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionView 

    func setupCollectionViewCells() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        let padding: CGFloat = 10                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
        layout.itemSize = CGSize(width: (screenWidth / 3) - padding, height: (screenWidth / 3) - padding)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vendingMachine.selection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! VendingItemCell
        let item = vendingMachine.selection[indexPath.row]
        cell.iconView.image=item.icon()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateCellBackgroundColor(indexPath, selected: true)
        reset()
        currentSelection = vendingMachine.selection[indexPath.row]
        updateTotalPrice()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        updateCellBackgroundColor(indexPath, selected: false)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        updateCellBackgroundColor(indexPath, selected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        updateCellBackgroundColor(indexPath, selected: false)
    }
    
    func updateCellBackgroundColor(_ indexPath: IndexPath, selected: Bool) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = selected ? UIColor(red: 41/255.0, green: 211/255.0, blue: 241/255.0, alpha: 1.0) : UIColor.clear
        }
    }

 
    // MARK: - Helper Methods
    @IBAction func addMoney() {
        vendingMachine.deposit(amount: 5.0)
        balanceLabel.text = "$\(vendingMachine.amountDepositied.extendValue)"
    }
    
    @IBAction func purchase() {
        if let currentSelection = currentSelection {
            do {
                try vendingMachine.vend(selection: currentSelection, quantity: quantity)
        balanceLabel.text = "$\(vendingMachine.amountDepositied.extendValue)"
            }
            catch VendingMachineError.OutofStock{
                showAlert(inTitle: "Out of Stock", inMessage: "😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩😩", dismissMessage: "Darn, my bad")
            }
            catch VendingMachineError.InvalidSelection{
                showAlert(inTitle: "You chose: Wrong", inMessage: "🌚", dismissMessage: "hi")
                
            }
            catch VendingMachineError.InsufficentFUnd(funds: 2.0){
                showAlert(inTitle: "Get some money", inMessage: "💸💸💸💸💸💸💸💸💸💸", dismissMessage: "Darn, you right")
            }
            catch {
             }
        }
        else {
            // FIXME: Alert user to no selection
        }
    }

    @IBAction func updateQuantity(_ sender: UIStepper) {
        quantityLabel.text="\(sender.value.cleanValue)"
        print(sender.value.cleanValue)
        quantity = sender.value
        updateTotalPrice()
    }

    func updateTotalPrice() {
        if let currentSelection = currentSelection, let item = vendingMachine.itemFotCurrentSelection(selection: currentSelection) {
            totalLabel.text = "$\((quantity*item.price).extendValue)"
        }

    }
    
    func reset(){
            quantity = 1
        updateTotalPrice()
         quantityLabel.text="\(quantity.cleanValue)"

        
    }

    
    func showAlert(inTitle: String, inMessage: String, dismissMessage: String){
        let alert = UIAlertController(title: inTitle, message: inMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: dismissMessage, style: .default, handler: dismissAlert)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    
        
    }

    func dismissAlert(sender: UIAlertAction) {
        reset()
        
    }
}
