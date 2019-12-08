//
//  FactSettings.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 07/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import UIKit
class FactSettings {
    private let fact: Fact
    private let categoryDefault = ["UNCATEGORIZED"]
    
    init(fact: Fact) {
        self.fact = fact
    }
    
    func getSizeText() -> CGFloat {
        var fontSize = FontSizeFact.less80Characters
        if fact.value.count > 80 {
            fontSize = .more80Characters
        }
        return fontSize.rawValue
    }
    func getFact() -> Fact {
        return Fact(value: fact.value, categories: formatCategory())
    }
    
    private func formatCategory() -> [String] {
        var category = getCategory(string: fact.categories)
        category = [setUppercase(string: category.first!)]
        return category
    }
    
    private func getCategory(string: [String]?) -> [String] {
        guard let category = string?.first else {
            return categoryDefault
        }
        return [category]
    }
    
    private func setUppercase(string: String) -> String {
        return string.uppercased()
    }
    
}
