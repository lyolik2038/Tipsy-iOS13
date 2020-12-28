//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Валерия Тишина on 05.12.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var billForEach : Float?
    var peopleCount : Int?
    var tipPercentage : Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tip : Int = Int((tipPercentage ?? 0.0) * 100)
        
        totalLabel.text = String(format: "%.0f", billForEach!)
        settingsLabel.text = "Split between \(peopleCount ?? 2) people, with \(tip)% tip"

    }

    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
