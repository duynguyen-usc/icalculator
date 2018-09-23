//
//  icalculatorUITests.swift
//  icalculatorUITests
//
//  Created by Duy on 9/22/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import XCTest

class icalculatorUITests: XCTestCase {

    override func setUp() {
       
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
    }

    func testNumberButtons() {
        
        let app = XCUIApplication()
        
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
        let app = XCUIApplication()
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
}
