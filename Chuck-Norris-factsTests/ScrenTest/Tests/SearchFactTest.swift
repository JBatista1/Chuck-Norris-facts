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
                
                let viewForTestPortrait =  self.createViewForTest(isPortrait: true)
                let viewForTestLandscape = self.createViewForTest(isPortrait: false)
                
                expect(viewForTestPortrait) == snapshot("SearchFactTest\(SizeViewTest.iPhone8.rawValue)_Portrait")
                expect(viewForTestLandscape) == snapshot("SearchFactTest\(SizeViewTest.iPhone8.rawValue)_Landscape")
            }
        }
    }
    func createViewForTest(isPortrait: Bool) -> UIView {
        let search = Search(frame: SizeViewTest.iPhone8.size)
        let viewForTest =  UIViewForSnapShot(TypeView: .iPhone8, isPortrait: isPortrait, withview: search)
        return viewForTest
    }
    
}

