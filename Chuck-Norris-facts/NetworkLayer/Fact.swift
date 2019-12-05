//
//  Fact.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 05/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
struct Fact: Codable {
    var fact: String
    var category: String
    
    init(fact: String, category: String) {
        self.fact = fact
        self.category = category
    }
}
