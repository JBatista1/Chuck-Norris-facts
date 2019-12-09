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
                let viewForTest =  self.createViewForTest()
                expect(viewForTest) == snapshot("FeedBackNotResult\(SizeViewTest.iPhone8.rawValue)")
            }
        }
    }
    func createViewForTest() -> UIView {
        let feedBack = SetupViewInHome.noResult.customView
        let viewForTest =  UIViewForSnapShot(TypeView: .iPhone8, isPortrait: true, withview: feedBack)
        return viewForTest
    }
}
