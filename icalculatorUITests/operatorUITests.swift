//
//  operatorUITests.swift
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
}
