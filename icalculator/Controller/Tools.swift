//
//  tools.swift
//  Compound Interest Calculator
//
//  Created by Duy on 9/7/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import Foundation

class Tools {
    static func formatNumber(d: Double) -> String {
        if (d >= 1) {
            let nsNum = NSNumber(value: d)
            let nf = NumberFormatter()
            nf.numberStyle = NumberFormatter.Style.decimal
            return nf.string(from: nsNum)!
        }
        else if(d == 0) {
            return "0"
        }
        else {
            return String(d)
        }
    }
    
    static func roundToTwoDecimals(d: Double) -> Double {
        return Double(round(100 * d)/100)
    }
}
