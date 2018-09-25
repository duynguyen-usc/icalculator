//
//  File.swift
//  icalculator
//
//  Created by Duy on 9/23/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import Foundation

class CmpInterestCalc {
    
    var term = 8.0
    var numTimesCompounded = 1.0
    var interestRate = 0.03
    var principal = 100000.0
    
    func setDefaults() {
        term = 12
        numTimesCompounded = 1
        interestRate = 0.025
        principal = 100000
    }
    
    func getFutureValue() -> Double {
        if (numTimesCompounded > 0 && interestRate > 0 && term > 0 && principal > 0){
            let rate = interestRate / numTimesCompounded
            let t = term * numTimesCompounded
            let fv = principal * pow((1 + rate), t)
            return Tools.roundToTwoDecimals(d: fv)
        }
        return 0
    }
    
    func getGain() -> Double {
        return Tools.roundToTwoDecimals(d: getFutureValue() - principal)
    }
    
}

