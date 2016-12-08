//
//  ViewController.swift
//  TipCalculator
//
//  Created by cmacgregor on 10/3/16.
//  Copyright © 2016 cmacgregor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billCostTF: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var eachLabel: UILabel!
    @IBOutlet weak var numPeople: UILabel!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var fithteenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var twentyFivePercentButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    var tipPercent = 0.0
    var splitNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numPeople.text = ""
        tipLabel.text = ""
        totalLabel.text = ""
        numPeople.text = "1"
        
    }
    
    func resetApp() {
        tenPercentButton.setImage(UIImage(named: "10Unselected"), for: UIControlState())
        fithteenPercentButton.setImage(UIImage(named: "15Unselected"), for: UIControlState())
        twentyPercentButton.setImage(UIImage(named: "20Unselected"), for: UIControlState())
        twentyFivePercentButton.setImage(UIImage(named: "25Unselected"), for: UIControlState())
    }
    
    @IBAction func on10ButtonTapped(_ sender: AnyObject) {
        resetApp()
        tenPercentButton.setImage(UIImage(named: "10Unselected"), for: UIControlState())
        tipPercent = 0.10
        calculate()
    }
    
    @IBAction func on15ButtonTapped(_ sender: AnyObject) {
        resetApp()
        fithteenPercentButton.setImage(UIImage(named: "15Unselected"), for: UIControlState())
        tipPercent = 0.15
        calculate()
    }
    @IBAction func on20ButtonTapped(_ sender: AnyObject) {
        resetApp()
        twentyPercentButton.setImage(UIImage(named: "20Unselected"), for: UIControlState())
        tipPercent = 0.20
        calculate()
    }
    @IBAction func on25ButtonTapped(_ sender: AnyObject) {
        resetApp()
        twentyFivePercentButton.setImage(UIImage(named: "25Unselected"), for: UIControlState())
        tipPercent = 0.25
        calculate()
    }
    
    func calculate() {
    if let amount = Double(billCostTF.text!){
        let tip = (amount * tipPercent) / Double(splitNumber)
        let total = (amount / Double(splitNumber)) + tip
        tipLabel.text = String(format: "Tip: $%.2f", tip)
        totalLabel.text = String(format: "Tip: $%.2f", total)
        billCostTF.endEditing(true)
        }
    }
    
    @IBAction func morePeopleButton(_ sender: AnyObject) {
        splitNumber += 1
        numPeople.text = String(splitNumber)
        calculate()
    }
    
     @IBAction func lessPeopleButton(_ sender: AnyObject) {
        if splitNumber > 1{
            splitNumber -= 1
            numPeople.text = String(splitNumber)
            calculate()
        }
    }
}
