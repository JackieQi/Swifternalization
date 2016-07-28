//
//  InequalityExtendedExpressionMatcherTests.swift
//  Swifternalization
//
//  Created by Tomasz Szulc on 27/06/15.
//  Copyright (c) 2015 Tomasz Szulc. All rights reserved.
//

import UIKit
import XCTest
import Swifternalization

class InequalityExtendedExpressionMatcherTests: XCTestCase {
    
    let steps = 20_000
    
    func createMatcher(pattern: ExpressionPattern) -> InequalityExtendedExpressionMatcher {
        return InequalityExtendedExpressionParser(pattern).parse() as! InequalityExtendedExpressionMatcher
    }
    
    // MARK: - Int
    func testIEX1() {
        let m = createMatcher(pattern: "iex:4<x<6")
        for n in Float.randomNumbersStrings(lower: 4.01, upper: 5.99, count: steps) { XCTAssertTrue(m.validate(n), "") }
        for n in Float.randomNumbersStrings(lower: -9999, upper: 4.0, count: steps) { XCTAssertFalse(m.validate(n), "") }
        for n in Float.randomNumbersStrings(lower: 6.0, upper: 9999, count: steps) { XCTAssertFalse(m.validate(n), "") }
    }
    
    func testIEX2() {
        let m = createMatcher(pattern: "iex:4<=x<10")
        for n in Float.randomNumbersStrings(lower: 4.00, upper: 9.99, count: steps) { XCTAssertTrue(m.validate(n), "") }
        for n in Float.randomNumbersStrings(lower: -9999, upper: 3.99, count: steps) { XCTAssertFalse(m.validate(n), "") }
        for n in Float.randomNumbersStrings(lower: 10.0, upper: 9999, count: steps) { XCTAssertFalse(m.validate(n), "") }
    }
    
    // MARK: - Float
    func testIEX3() {
        let m = createMatcher(pattern: "iex:4.99<x<9.99")
        for n in Float.randomNumbersStrings(lower: 5.00, upper: 9.98, count: steps) { XCTAssertTrue(m.validate(n), "") }
        for n in Float.randomNumbersStrings(lower: -9999, upper: 4.99, count: steps) { XCTAssertFalse(m.validate(n), "") }
        for n in Float.randomNumbersStrings(lower: 10.0, upper: 9999, count: steps) { XCTAssertFalse(m.validate(n), "") }
    }
    
    func testIEX4() {
        let m = createMatcher(pattern: "iex:-10.33<=x<10.4")
        for n in Float.randomNumbersStrings(lower: -10.33, upper: 10.4, count: steps) { XCTAssertTrue(m.validate(n), "") }
        for n in Float.randomNumbersStrings(lower: -9999, upper: -10.34, count: steps) { XCTAssertFalse(m.validate(n), "") }
        for n in Float.randomNumbersStrings(lower: 10.41, upper: 9999, count: steps) { XCTAssertFalse(m.validate(n), "") }
    }
}
