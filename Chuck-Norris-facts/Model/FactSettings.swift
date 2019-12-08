//
//  FactSettings.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 07/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation

class FactSettings {
    private let fact: Fact
    private let categoryDefault = "UNCATEGORIZED"
    
    init(fact: Fact) {
        self.fact = fact
    }
    
    func getSizeText() -> FontSizeFact {
        var fontSize = FontSizeFact.less80Characters
        if fact.value.count > 80 {
            fontSize = .more80Characters
        }
        return fontSize
    }
    
    func getCategory() -> String {
        let category = setCategory(string: fact.categories)
        return setUppercase(string: category)
    }
    
    private func setCategory(string: [String]?) -> String {
        guard let category = string?[0] else {
            return categoryDefault
        }
        return category
    }
    
    private func setUppercase(string: String) -> String {
        return string.uppercased()
    }
    
}
