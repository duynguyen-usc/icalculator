//
//  icalculatorUITests.swift
//  icalculatorUITests
//
//  Created by Duy on 9/22/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import XCTest

class icalculatorUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
       
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
    }

    func testNumberButtons() {
        
        app.buttons["C"].tap()
        XCTAssertEqual(true, app.staticTexts["0"].exists)
        
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["0"].tap()
        XCTAssertEqual(false, app.staticTexts["0"].exists)
        XCTAssertEqual(true, app.staticTexts["1234567890"].exists)
       
        app.buttons["C"].tap()
        XCTAssertEqual(true, app.staticTexts["0"].exists)
        XCTAssertEqual(false, app.staticTexts["1234567890"].exists)
    }
    
    func testDecimalButton() {
        
        app.buttons["C"].tap()
        XCTAssertEqual(true, app.staticTexts["0"].exists)
        
        app.buttons["1"].tap()
        app.buttons["."].tap()
        app.buttons["4"].tap()
        app.buttons["6"].tap()
        XCTAssertEqual(false, app.staticTexts["0"].exists)
        XCTAssertEqual(true, app.staticTexts["1.46"].exists)
        
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        XCTAssertEqual(true, app.staticTexts["1.4689"].exists)
        
        app.buttons["C"].tap()
        XCTAssertEqual(false, app.staticTexts["1.4689"].exists)
        XCTAssertEqual(true, app.staticTexts["0"].exists)
        
        app.buttons["."].tap()
        app.buttons["0"].tap()
        app.buttons["7"].tap()
        app.buttons["1"].tap()
        app.buttons["5"].tap()
        XCTAssertEqual(true, app.staticTexts["0.0715"].exists)
        
        app.buttons["."].tap()
        app.buttons["6"].tap()
        app.buttons["8"].tap()
        XCTAssertEqual(true, app.staticTexts["0.071568"].exists)
        
        XCUIApplication().buttons["←"].tap()
        XCUIApplication().buttons["←"].tap()
        XCUIApplication().buttons["←"].tap()
        XCUIApplication().buttons["←"].tap()
        XCTAssertEqual(true, app.staticTexts["0.07"].exists)
        
        XCUIApplication().buttons["←"].tap()
        XCUIApplication().buttons["←"].tap()
        XCTAssertEqual(false, app.staticTexts["0.07"].exists)
        XCTAssertEqual(false, app.staticTexts["0."].exists)
        XCTAssertEqual(true, app.staticTexts["0"].exists)
    }
    
    func testAddUI() {
        
        app.buttons["C"].tap()
        XCTAssertEqual(true, app.staticTexts["0"].exists)
        
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["3.0"].exists)
        
        app.buttons["+"].tap()
        app.buttons["4"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["47.0"].exists)
        
        app.buttons["+"].tap()
        app.buttons["5"].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        XCTAssertEqual(true, app.staticTexts["601.0"].exists)
        
        app.buttons["1"].tap()
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["602.0"].exists)
    }
    
    func testSubtractUI() {
        
        app.buttons["C"].tap()
        XCTAssertEqual(true, app.staticTexts["0"].exists)
        
        app.buttons["1"].tap()
        app.buttons["1"].tap()
        app.buttons["-"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["9.0"].exists)
        
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["-65.0"].exists)
        
        app.buttons["-"].tap()
        app.buttons["3"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["-"].tap()
        XCTAssertEqual(true, app.staticTexts["-443.0"].exists)
        
        app.buttons["7"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["-517.0"].exists)
    }
    
    func testMultiply() {
        
        app.buttons["C"].tap()
        XCTAssertEqual(true, app.staticTexts["0"].exists)
        
        app.buttons["7"].tap()
        app.buttons["×"].tap()
        app.buttons["6"].tap()
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["42.0"].exists)
        
        app.buttons["×"].tap()
        app.buttons["6"].tap()
        app.buttons["×"].tap()
        XCTAssertEqual(true, app.staticTexts["252.0"].exists)
        
        app.buttons["9"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["24948.0"].exists)
    }
    
    func testDivide() {
        
        app.buttons["C"].tap()
        XCTAssertEqual(true, app.staticTexts["0"].exists)
        
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["÷"].tap()
        app.buttons["6"].tap()
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["9.0"].exists)
        
        app.buttons["÷"].tap()
        app.buttons["3"].tap()
        app.buttons["÷"].tap()
        XCTAssertEqual(true, app.staticTexts["3.0"].exists)
        
        app.buttons["3"].tap()
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["1.0"].exists)
    }
    
    func testChangeSign() {
        
        app.buttons["C"].tap()
        XCTAssertEqual(true, app.staticTexts["0"].exists)
        
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+/-"].tap()
        XCTAssertEqual(true, app.staticTexts["-54.0"].exists)
        
        app.buttons["+/-"].tap()
        XCTAssertEqual(true, app.staticTexts["54.0"].exists)
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
}
