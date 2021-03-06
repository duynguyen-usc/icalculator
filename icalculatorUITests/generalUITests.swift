//
//  icalculatorUITests.swift
//  icalculatorUITests
//
//  Created by Duy on 9/22/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import XCTest

class generalUITests: XCTestCase {
    
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
        
        app.buttons["←"].tap()
        app.buttons["←"].tap()
        app.buttons["←"].tap()
        app.buttons["←"].tap()
        XCTAssertEqual(true, app.staticTexts["0.07"].exists)
        
        app.buttons["←"].tap()
        app.buttons["←"].tap()
        XCTAssertEqual(false, app.staticTexts["0.07"].exists)
        XCTAssertEqual(false, app.staticTexts["0."].exists)
        XCTAssertEqual(true, app.staticTexts["0"].exists)
        
        app.buttons["."].tap()
        XCTAssertEqual(true, app.staticTexts["0."].exists)
        
        app.buttons["0"].tap()
        app.buttons["6"].tap()
        XCTAssertEqual(true, app.staticTexts["0.06"].exists)
        
        app.buttons["+"].tap()
        app.buttons["."].tap()
        app.buttons["0"].tap()
        app.buttons["3"].tap()
        XCTAssertEqual(true, app.staticTexts["0.03"].exists)
        
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["0.09"].exists)
        
        app.buttons["×"].tap()
        app.buttons["3"].tap()
        XCTAssertEqual(true, app.staticTexts["3"].exists)
        
        app.buttons["="].tap()
        XCTAssertEqual(true, app.staticTexts["0.27"].exists)
        
        app.buttons["C"].tap()
        XCTAssertEqual(true, app.staticTexts["0"].exists)
    }
    
    func testClear() {
        app.buttons["1"].tap()
        app.buttons["1"].tap()
        app.buttons["1"].tap()
        XCTAssertEqual(true, app.staticTexts["111"].exists)
        
        app.buttons["4"].tap()
        app.buttons["4"].tap()
        app.buttons["4"].tap()
        XCTAssertEqual(true, app.staticTexts["111444"].exists)
        
        app.buttons["C"].tap()
        XCTAssertEqual(true, app.staticTexts["0"].exists)
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
    
    func testPercentDown() {
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        app.buttons["0"].tap()
        XCTAssertEqual(true, app.staticTexts["100"].exists)
        
        app.buttons["↓%"].tap()
        XCTAssertEqual(true, app.staticTexts["93.0"].exists)
    }
}
