//
//  Calculate.swift
//  icalculator
//
//  Created by Duy on 9/23/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import Foundation

enum OperationType : Int {
    case NONE
    case EQUALS = 10
    case ADD
    case SUBTRACT
    case MULTIPLY
    case DIVIDE
    case CHANGE_SIGN
    case PERCENT_DOWN
}

class Calculate {
    var n1: Double = 0.0
    var n2: Double = 0.0
    var operation: OperationType = OperationType.NONE
    
    func equals() -> Double {
        switch operation {
        case OperationType.ADD:
            return n1 + n2
            
        case OperationType.SUBTRACT:
            return n1 - n2
            
        case OperationType.MULTIPLY:
            return n1 * n2
            
        case OperationType.DIVIDE:
            return n1 / n2
            
        case OperationType.PERCENT_DOWN:
            return round(1000 * (n1 * (1 - 0.07)) / 1000)
            
        case OperationType.CHANGE_SIGN:
            return n1 * -1
            
        default:
            return 0
        }
    }
}
