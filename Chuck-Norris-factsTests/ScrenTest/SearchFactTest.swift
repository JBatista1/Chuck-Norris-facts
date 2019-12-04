//
//  SearchFactTest.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 03/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import UIKit

@testable import Chuck_Norris_facts

class SearchFactTest: QuickSpec,ViewForTest {

    override func spec() {
        describe("in some context") {
            it("has valid snapshot") {
                
                let viewForTest =  self.createViewForTest()
                expect(viewForTest) == snapshot("SearchFact\(SizeViewTest.iPhone8.rawValue)")
            }
        }
    }
    func createViewForTest() -> UIView {
        let search = SearchFact(frame: SizeViewTest.iPhone8.size)
        let viewForTest =  UIViewForSnapShot(TypeView: .iPhone8, isPortrait: true, withview: search)
        return viewForTest
    }
}

