//
//  CardScreenTest.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 01/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import UIKit

@testable import Chuck_Norris_facts

class FactViewCellTest: QuickSpec, ViewForTest {
    override func spec() {
        describe("in some context") {
            it("has valid snapshot") {
                let view = self.createViewForTest()
                expect(view) == snapshot("Card\(SizeViewTest.card.rawValue)")
            }
        }
    }
    func createViewForTest() -> UIView {
        let card = FactTableViewCell(frame: SizeViewTest.card.size)
        card.factLabel.text = "Chuck Noris, Jesus, and Barack Obama were standing by a lake. Jesus walked out on the water and was shortly followed by Chuck. Obama tried to follow, but fell in the water. After muck kicking and splashing Jesus said. Do you think we should tell him about the “stepping stone”? Chuck then said: “What stepping stone?"
        let viewForTest = UIViewForSnapShot(TypeView: .card, isPortrait: true, withview: card)
        return viewForTest
    }
}
