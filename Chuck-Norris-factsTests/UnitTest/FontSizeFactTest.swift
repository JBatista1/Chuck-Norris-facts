//
//  FontSizeFactTest.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 09/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//


import Foundation
import XCTest
@testable import Chuck_Norris_facts

class FontSizeFactTest: XCTestCase {
    var fontSize: FontSizeFact!
    
    override func setUp() {
        super.setUp()
    }
    func testSizeMore80Characters(){
        fontSize = FontSizeFact.more80Characters
        let size = Int(fontSize.rawValue)
        XCTAssertEqual(size, 17)
    }
    func testSizeLess80Characters(){
           fontSize = FontSizeFact.less80Characters
           let size = Int(fontSize.rawValue)
           XCTAssertEqual(size, 23)
       }
}
