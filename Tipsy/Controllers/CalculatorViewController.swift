//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.20
    var finalTip = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        if sender == tenPctButton {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            
            print(sender.currentTitle!)
        }
        
        else if sender == zeroPctButton {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            print(sender.currentTitle!)
        }
        
        else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            
            print(sender.currentTitle!)
        }
        
        
        // Appbrewery Code
        
//        zeroPctButton.isSelected = false
//        tenPctButton.isSelected = false
//        twentyPctButton.isSelected = false
//        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100

        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        print(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
//        print(format: "%.2f", )
        
        print(splitNumberLabel.text!)
        print(billTextField.text ?? 0)
        print(tip)

        
        print(String(format: "%.2f", (Double(billTextField.text ?? "0") ?? 0.0) / Double(splitNumberLabel.text!)! + (Double(billTextField.text ?? "0") ?? 0.0) / Double(splitNumberLabel.text!)! * tip))
        
        finalTip = (Double(billTextField.text ?? "0") ?? 0.0) / Double(splitNumberLabel.text!)! + ((Double(billTextField.text ?? "0") ?? 0.0) / Double(splitNumberLabel.text!)! * tip)
        
        
        if tenPctButton.isSelected == true {
            print(tenPctButton.currentTitle!)
        }
        
        else if zeroPctButton.isSelected == true {
            print(zeroPctButton.currentTitle!)
        }
        
        else {
            print(twentyPctButton.currentTitle!)
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amount = finalTip
            destinationVC.people = splitNumberLabel.text
            destinationVC.tipPercent = String("\(Int(tip * 100))%")
        }
    }
    
}

