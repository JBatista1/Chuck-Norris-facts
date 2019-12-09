//
//  FactSettingsTests.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 09/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import XCTest
@testable import Chuck_Norris_facts
class FactSettingsTests: XCTestCase {
    var factSetting: FactSettings!
    override func setUp() {
        super.setUp()
    }
    
    func testGetSizeTextMore80() {
        let value  = "Chuck Noris, Jesus, and Barack Obama were standing by a lake. Jesus walked out on the water and was shortly followed by Chuck. Obama tried to follow, but fell in the water. After muck kicking and splashing Jesus said. Do you think we should tell him about the “stepping stone”? Chuck then said: “What stepping stone?"
        let fact = Fact(value: value, categories: ["dev"])
        factSetting = FactSettings(fact: fact)
        let size = Int(factSetting.getSizeText())
        XCTAssertEqual(size, 17)
        
    }
    func testGetSizeTextless80() {
        let value  = "Are your base are belong to Chuck Norris."
        let fact = Fact(value: value, categories: ["dev"])
        factSetting = FactSettings(fact: fact)
        let size = Int(factSetting.getSizeText())
        XCTAssertEqual(size, 23)
        
    }
    func testsetUppercaseCategory(){
        let value  = "Are your base are belong to Chuck Norris."
        let fact = Fact(value: value, categories: ["dev"])
        factSetting = FactSettings(fact: fact)
        let formatedFact = factSetting.getFact()
        XCTAssertEqual(formatedFact.categories[0], "DEV")
    }
    func testUncategorized(){
         let value  = "Are your base are belong to Chuck Norris."
         let fact = Fact(value: value, categories: [])
         factSetting = FactSettings(fact: fact)
         let formatedFact = factSetting.getFact()
         XCTAssertEqual(formatedFact.categories[0], "UNCATEGORIZED")
     }
    func testSameCategoryAsFirstCategory(){
        let value  = "Are your base are belong to Chuck Norris."
        let fact = Fact(value: value, categories: ["dev","animal","career","celebrity"])
        factSetting = FactSettings(fact: fact)
        let formatedFact = factSetting.getFact()
        XCTAssertEqual(formatedFact.categories[0], "DEV")
    }
    
}
