//
//  FeedBackProperties.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 09/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import UIKit
enum FeedBackProperties {
    case initial
    case notResult
    
    var feedBack: (text: String,image: UIImage) {
        switch self {
        case .initial:
            return ("Search facts about Chuck Norris", UIImage(named: "initial")!)
        case .notResult:
            return ("No results found. Try again", UIImage(named: "notResult")!)
        }
    }
}

