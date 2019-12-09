//
//  FeedBackPropertiesTest.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 09/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import XCTest
@testable import Chuck_Norris_facts

class FeedBackPropertiesTest: XCTestCase {
    var feedBackProperties: FeedBackProperties!
    
    override func setUp() {
        super.setUp()
    }
    func testReturnInitial(){
        let properties = (text: "Search facts about Chuck Norris",image: UIImage(named: "initial")!)
        feedBackProperties =  FeedBackProperties.initial
        XCTAssertEqual(feedBackProperties.feedBack.text, properties.text)
        XCTAssertEqual(feedBackProperties.feedBack.image, properties.image)
    }
    func testReturnNotResul(){
        let properties = (text: "No results found. Try again",image: UIImage(named: "notResult")!)
        feedBackProperties =  FeedBackProperties.notResult
        XCTAssertEqual(feedBackProperties.feedBack.text, properties.text)
        XCTAssertEqual(feedBackProperties.feedBack.image, properties.image)
    }
}
