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


    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
