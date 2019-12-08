//
//  HomeScrenUITest.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 30/11/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import UIKit

@testable import Chuck_Norris_facts

class HomeScreenTest: QuickSpec,ViewForTest {

    override func spec() {
        describe("in some context") {
            it("has valid snapshot") {
                let viewForTest =  self.createViewForTest()
                expect(viewForTest) == snapshot("HomeScreen\(SizeViewTest.iPhone8.rawValue)")
            }
        }
    }
    func createViewForTest() -> UIView {
        let home = Home(frame: SizeViewTest.iPhone8.size)
        let viewForTest =  UIViewForSnapShot(TypeView: .iPhone8, isPortrait: true, withview: home)
        return viewForTest
    }
}
