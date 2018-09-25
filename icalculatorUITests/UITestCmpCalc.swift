//
//  cmpCalcUITest.swift
//  icalculatorUITests
//
//  Created by Duy on 9/24/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import XCTest

class UITestCmpCalc: XCTestCase {
    
    func testPrincipal() {
        let app = XCUIApplication()
        
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        app.buttons["0"].tap()
        app.buttons["0"].tap()
        app.buttons["0"].tap()
        app.buttons["P"].tap()
    }
    
    func testInterestRate() {
        
    }
    
    func testTerm(){
        
    }
    
    func testNumTimesCompounded(){
        
    }
}
