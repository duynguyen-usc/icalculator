//
//  icalculatorTests.swift
//  icalculatorTests
//
//  Created by Duy on 9/22/18.
//  Copyright © 2018 Duy. All rights reserved.
//

import XCTest
@testable import icalculator

class icalculatorTests: XCTestCase {

    func testCalculate() {
        
        let c: Calculate = Calculate()
        
        c.n1 = 20
        c.n2 = 10
        c.operation = OperationType.ADD
        XCTAssertEqual(30, c.equals())
        
        c.operation = OperationType.SUBTRACT
        XCTAssertEqual(10, c.equals())
        
        c.operation = OperationType.MULTIPLY
        XCTAssertEqual(200, c.equals())
        
        c.operation = OperationType.DIVIDE
        XCTAssertEqual(2, c.equals())
        
        c.operation = OperationType.CHANGE_SIGN
        XCTAssertEqual(-20, c.equals())
        
        c.n1 = 100
        c.operation = OperationType.PERCENT_DOWN
        XCTAssertEqual(93, c.equals())
    }
}
