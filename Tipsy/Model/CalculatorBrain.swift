//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Валерия Тишина on 11.12.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var billForEach : Float = 0.0
    var peopleCount : Int = 0
    var tipPercentage : Float = 0.0
    
    mutating func calculateBillForEach(totalBill: Float, tipPercentage: Float, peopleCount: Int) {
        
        self.billForEach = (totalBill + (totalBill * tipPercentage)) / Float(peopleCount)
        self.peopleCount = peopleCount
        self.tipPercentage = tipPercentage
        
    }
    
}
