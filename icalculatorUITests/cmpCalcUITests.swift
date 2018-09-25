//
//  cmpCalcUITests.swift
//  icalculatorUITests
//
//  Created by Duy on 9/25/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import XCTest

class operatorUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
    }
    
    func testCmpCalc() {
        
        app.buttons["C"].tap()
        XCTAssertEqual(true, app.staticTexts["0"].exists)
        
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        app.buttons["0"].tap()
        app.buttons["P"].tap()
        XCTAssertEqual(true, app.staticTexts["126.68"].exists)
        
        app.buttons["6"].tap()
        app.buttons["I/R"].tap()
        XCTAssertEqual(true, app.staticTexts["159.38"].exists)
        
        app.buttons["4"].tap()
        app.buttons["T"].tap()
        XCTAssertEqual(true, app.staticTexts["126.25"].exists)
        
        app.buttons["3"].tap()
        app.buttons["N"].tap()
        XCTAssertEqual(true, app.staticTexts["126.82"].exists)
    }
    
    func testInfoLabels() {
        
        XCTAssertEqual(false, app.staticTexts["term = 12 (n = 1)"].exists)
        XCTAssertEqual(false, app.staticTexts["interest = 3.0%"].exists)
        XCTAssertEqual(false, app.staticTexts["pv = 100000"].exists)
        XCTAssertEqual(false, app.staticTexts["fv = 120,000"].exists)
        
        app.buttons["4"].tap()
        app.buttons["4"].tap()
        app.buttons["4"].tap()
        app.buttons["P"].tap()
        
        XCTAssertEqual(true, app.staticTexts["term = 8.0"].exists)
        XCTAssertEqual(true, app.staticTexts["interest = 3.0%"].exists)
        XCTAssertEqual(true, app.staticTexts["pv = 444.0"].exists)
        XCTAssertEqual(true, app.staticTexts["fv = 562.45"].exists)
        XCTAssertEqual(true, app.staticTexts["118.45"].exists)
    }
}
