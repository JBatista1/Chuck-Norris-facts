//
//  SetupViewInHome.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 08/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import UIKit
enum SetupViewInHome {
    case initial
    case noResult
    case sucess
    
    var customView: UIView {
        switch self {
        case .initial:
            let data = FeedBackProperties.initial.feedBack
            return FeedBack(frame: .zero, text: data.text, image: data.image)
        case .noResult:
             let data = FeedBackProperties.notResult.feedBack
             return FeedBack(frame: .zero, text: data.text, image: data.image)
        case .sucess:
            return Home(frame: .zero)
        }
    }
}
