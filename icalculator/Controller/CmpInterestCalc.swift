//
//  File.swift
//  icalculator
//
//  Created by Duy on 9/23/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import Foundation

class CmpInterestCalc {
    
    init() {
        setDefaults()
    }
    var term: Double = 0.0
    var numTimesCompounded: Double = 0.0
    var interestRate: Double = 0.0
    var principal:Double = 0.0
    
    func setDefaults() {
        term = 8
        numTimesCompounded = 1.0
        interestRate = 0.03
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

