//
//  Chuck_Norris_factsUITests.swift
//  Chuck-Norris-factsUITests
//
//  Created by Joao Batista on 25/11/19.
//  Copyright © 2019 Joao Batista. All rights reserved.


import XCTest

class Chuck_Norris_factsUITests: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }
    func testDissmissSearchFact() {
        let app = XCUIApplication()
        app.navigationBars["Chuck Norris Facts"].buttons["magnifyingglass"].tap()
        app.buttons["xmark"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
    }
    func testSearchFact(){
         let textMock = "Brazil"
              let app = XCUIApplication()
              let chuckNorrisFactsNavigationBar = app.navigationBars["Chuck Norris Facts"]
              chuckNorrisFactsNavigationBar.buttons["magnifyingglass"].tap()
              let textField = app.textFields["Searching..."]
              textField.tap()
              textField.typeText(textMock)
              app.buttons["Searching"].tap()

    }
    
    func testTextless3characters() {
        let textMock = "A"
        let app = XCUIApplication()
        app.navigationBars["Chuck Norris Facts"].buttons["magnifyingglass"].tap()
        app.textFields["Searching..."].tap()
        let textField = app.textFields["Searching..."]
        textField.tap()
        textField.typeText(textMock)
        app.buttons["Searching"].tap()
    }
    
    
    
}
