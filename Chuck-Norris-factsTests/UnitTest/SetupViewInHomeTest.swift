//
//  SetupViewInHomeTest.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 09/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//


import Foundation
import XCTest
@testable import Chuck_Norris_facts
class SetupViewInHomeTest: XCTestCase {
    var setupView: SetupViewInHome!
    
    override func setUp() {
        super.setUp()
    }
    func testReturnInitial()  {
        setupView = SetupViewInHome.initial
        var isFeedBackView = false
        if let _ = setupView.customView as? FeedBack {
            isFeedBackView = true
        }
        XCTAssertTrue(isFeedBackView)
    }
    func testReturnNoResult()  {
        setupView = SetupViewInHome.noResult
        var isFeedBackView = false
        if let _ = setupView.customView as? FeedBack {
            isFeedBackView = true
        }
        XCTAssertTrue(isFeedBackView)
    }
    func testReturnSucess()  {
        setupView = SetupViewInHome.sucess
        var isFeedBackView = false
        if let _ = setupView.customView as? Home {
            isFeedBackView = true
        }
        XCTAssertTrue(isFeedBackView)
    }
}
