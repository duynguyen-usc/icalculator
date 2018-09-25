//
//  ViewController.swift
//  icalculator
//
//  Created by Duy on 9/22/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import UIKit

enum CState: Int {
    case None
    case InputtingFirstNumber
    case OperationSelected
    case InputtingSecondNumber
    case Equals
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        clearInfoDisplay()
        display1.text = "0"
    }
    
    let calculator = Calculate()
    let cmpCalc = CmpInterestCalc()
    var calcState = CState.None
    
    @IBOutlet weak var display1: UILabel!
    @IBOutlet weak var info1: UILabel!
    @IBOutlet weak var info2: UILabel!
    @IBOutlet weak var info3: UILabel!
    @IBOutlet weak var info4: UILabel!
    
    @IBAction func clearPressed(_ sender: UIButton) {
        display1.text = "0"
        calcState = CState.None
        cmpCalc.setDefaults()
        clearInfoDisplay()
    }
    
    @IBAction func backSpacePressed(_ sender: UIButton) {
        var newStr = String(display1.text!.dropLast())
        if (newStr.hasSuffix(".")) {
            newStr = String(newStr.dropLast())
        }
        if (newStr == "") {
            newStr = "0"
        }
        display1.text = newStr
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if (isNewInput()) {
            display1.text = ""
        }
        display1.text = display1.text! + String(sender.tag)
        updateCalcState()
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        if (isNewInput()){
            display1.text = "0."
        }
        else if (!display1.text!.contains(".")) {
            display1.text = display1.text! + "."
        }
        updateCalcState()
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        if(calcState == CState.InputtingSecondNumber){
            calculator.n2 = getDisplayValue()
            valueToDisplay(value: calculator.equals())
        }
        calculator.n1 = getDisplayValue()
        calculator.operation = OperationType(rawValue: sender.tag)!
        calcState = CState.OperationSelected
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        calculator.n2 = getDisplayValue()
        valueToDisplay(value: calculator.equals())
        calcState = CState.Equals
    }
    
    @IBAction func changeSignPressed(_ sender: UIButton) {
        calculator.n1 = getDisplayValue()
        calculator.operation = OperationType.CHANGE_SIGN
        valueToDisplay(value: calculator.equals())
    }
    
    @IBAction func percentDownPressed(_ sender: UIButton) {
    }

    @IBAction func nPressed(_ sender: UIButton) {
        cmpCalc.numTimesCompounded = getDisplayValue()
        cmpResult()
    }
    
    @IBAction func termPressed(_ sender: UIButton) {
        cmpCalc.term = getDisplayValue()
        cmpResult()
    }
    
    @IBAction func principalPressd(_ sender: UIButton) {
        cmpCalc.principal = getDisplayValue()
        cmpResult()
    }
    
    @IBAction func interestPressed(_ sender: UIButton) {
        cmpCalc.interestRate = getDisplayValue() / 100
        cmpResult()
    }
    
    func getDisplayValue() -> Double {
        if let dv = display1.text {
            return Double(dv)!
        }
        return 0
    }
    
    func valueToDisplay(value: Double) {
        display1.text = String(value)
    }
    
    func cmpResult() {
        valueToDisplay(value: cmpCalc.getGain())
        calcState = CState.Equals
        updateInfoDisplay()
    }
    
    func isNewInput() -> Bool {
        return (display1.text == "0" ||
            calcState == CState.OperationSelected ||
            calcState == CState.Equals)
    }
    
    func updateCalcState() {
        if (calcState == CState.None || calcState == CState.Equals) {
            calcState = CState.InputtingFirstNumber
        }
        else if (calcState == CState.OperationSelected) {
            calcState = CState.InputtingSecondNumber
        }
    }
    
    func updateInfoDisplay() {
        info1.text = "interest = \(cmpCalc.interestRate)"
        info2.text = "term = \(cmpCalc.term)"
        info3.text = "pv = \(cmpCalc.principal)"
        info4.text = "fv = \(cmpCalc.getFutureValue())"
    }
    
    func clearInfoDisplay() {
        info1.text = ""
        info2.text = ""
        info3.text = ""
        info4.text = ""
    }
}

