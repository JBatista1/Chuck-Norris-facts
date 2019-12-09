//
//  FeedBackINotResultScreen.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 09/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//


import Quick
import Nimble
import Nimble_Snapshots
import UIKit

@testable import Chuck_Norris_facts

class FeedBackINotResultScreen: QuickSpec,ViewForTest {

    override func spec() {
        describe("in some context") {
            it("has valid snapshot") {
                let viewForTestPortrait =  self.createViewForTest(isPortrait: true)
                let viewForTestLandscape = self.createViewForTest(isPortrait: false)
                
                expect(viewForTestPortrait) == snapshot("FeedBackINotResultScreen\(SizeViewTest.iPhone8.rawValue)_Portrait")
                expect(viewForTestLandscape) == snapshot("FeedBackINotResultScreen\(SizeViewTest.iPhone8.rawValue)_Landscape")
            }
        }
    }
    func createViewForTest(isPortrait: Bool) -> UIView {
        let feedBack = SetupViewInHome.noResult.customView
        let viewForTest =  UIViewForSnapShot(TypeView: .iPhone8, isPortrait: isPortrait, withview: feedBack)
        return viewForTest
    }
}
