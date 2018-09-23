//
//  ViewController.swift
//  icalculator
//
//  Created by Duy on 9/22/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import UIKit

enum Operation : Int {
    case NONE
    case ADD = 10
    case SUBTRACT
    case MULTIPLY
    case DIVIDE
    case EQUALS
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var display1: UILabel!
    @IBOutlet weak var display2: UILabel!
    @IBOutlet weak var display3: UILabel!
    
    var num1: Double = 0.0;
    var num2: Double = 0.0;
    
    @IBAction func clearPressed(_ sender: UIButton) {
        display1.text = "0"
    }
    
    @IBAction func backSpacePressed(_ sender: UIButton) {
        var newStr = String(display1.text!.dropLast())
        if (newStr.hasSuffix(".")) {
            newStr = String(newStr.dropLast())
        }
        display1.text = newStr
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if (display1.text == "0"){
            display1.text = ""
        }
        display1.text = display1.text! + String(sender.tag)
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        if(!display1.text!.contains(".")) {
            display1.text = display1.text! + "."
        }
        else if (display1.text! == "0") {
            display1.text = "0."
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
    }
    
    @IBAction func cmpParameterPressed(_ sender: UIButton) {
    }
    
    @IBAction func changeSignPressed(_ sender: UIButton) {
    }
    
    @IBAction func percentDownPressed(_ sender: UIButton) {
    }
}

