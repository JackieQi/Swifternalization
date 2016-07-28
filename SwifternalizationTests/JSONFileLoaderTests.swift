//
//  JSONFileLoaderTests.swift
//  Swifternalization
//
//  Created by Tomasz Szulc on 21/07/15.
//  Copyright (c) 2015 Tomasz Szulc. All rights reserved.
//

import UIKit
import XCTest

class JSONFileLoaderTests: XCTestCase {
    
    // Expressions
    func loadExpressions(cc: CountryCode) -> Dictionary<String, String> {
        return JSONFileLoader.loadExpressions(cc, bundle: Bundle.testBundle())
    }
    
    func testShouldLoadBaseExpressions() {
        XCTAssertFalse(loadExpressions(cc: "base").isEmpty, "")
    }
    
    func testShouldLoadPLExpressions() {
        XCTAssertFalse(loadExpressions(cc: "pl").isEmpty, "")
    }
    
    func testShouldLoadRUExpressions() {
        XCTAssertFalse(loadExpressions(cc: "ru").isEmpty, "")
    }
    
    func testShouldNotLoadDEExpressions() {
        XCTAssertTrue(loadExpressions(cc: "de").isEmpty, "")
    }
    
    // Translations
    func loadTranslations(cc: CountryCode) -> JSONDictionary {
        return JSONFileLoader.loadTranslations(cc, bundle: Bundle.testBundle())
    }

    func testShouldLoadBaseTranslations() {
        XCTAssertFalse(loadTranslations(cc: "base").isEmpty, "")
    }
    
    func testShouldLoadPLTranslations() {
        XCTAssertFalse(loadTranslations(cc: "pl").isEmpty, "")
    }
    
    func testShouldNotLoadDETranslations() {
        XCTAssertTrue(loadTranslations(cc: "de").isEmpty, "")
    }
}
