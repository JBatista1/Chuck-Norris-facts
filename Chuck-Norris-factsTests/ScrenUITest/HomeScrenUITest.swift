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

class HomeScrenUITest: QuickSpec {
   override func spec() {
        describe("in some context") {
            it("has valid snapshot") {
               
                let home = Home(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
                let cell = home.factsTableView.dequeueReusableCell(withIdentifier: "id") as! FactTableViewCell
                cell.factLabel.text = "tutu"
                home.factsTableView.dequeueReusableCell(withIdentifier: "id")
                
                expect(home) == recordSnapshot("Home")
            }
        }
    }
}
