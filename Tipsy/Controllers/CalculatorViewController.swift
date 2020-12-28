//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var stepperValue : String = "2"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        if sender == zeroPctButton {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if sender == tenPctButton {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else if sender == twentyPctButton {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func onStepperValueChanged(_ sender: UIStepper) {
        
        billTextField.endEditing(true)
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        stepperValue = String(format: "%.0f", sender.value)
    }
  
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        
        var totalBill : Float = 0.0
        var tipPercentage : Float = 0.0
        let peopleCount : Int = Int((stepperValue as NSString).intValue)//(stepperValue as NSString).floatValue
        
        totalBill = (billTextField.text! as NSString).floatValue
        
        if zeroPctButton.isSelected {
            tipPercentage = 0.0
        } else if tenPctButton.isSelected {
            tipPercentage = 0.1
        } else if twentyPctButton.isSelected {
            tipPercentage = 0.2
        }
        
        calculatorBrain.calculateBillForEach(totalBill: totalBill, tipPercentage: tipPercentage, peopleCount: peopleCount)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billForEach = calculatorBrain.billForEach
            destinationVC.peopleCount = calculatorBrain.peopleCount
            destinationVC.tipPercentage = calculatorBrain.tipPercentage
        }
    }
}

