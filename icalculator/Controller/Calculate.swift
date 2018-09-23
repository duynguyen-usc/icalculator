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
    case ADD = 10
    case SUBTRACT
    case MULTIPLY
    case DIVIDE
    case EQUALS
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
            
        default:
            return 0
        }
    }
}
