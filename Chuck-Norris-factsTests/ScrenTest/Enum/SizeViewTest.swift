//
//  SizeViewTest.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 01/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import UIKit
enum SizeViewTest:String, CaseIterable {
    case iPhone8 = "-iPhone-8"
    case iPhoneX = "-iPhone-X"
    case card = "-Card"
    var size : CGRect{
        switch self {
        case .iPhone8:
            return CGRect(x: 0.0, y: 0.0, width: 375, height: 667)
        case .iPhoneX:
            return CGRect(x: 0.0, y: 0.0, width: 375, height: 812)
        case .card:
            return CGRect(x: 0.0, y: 0.0, width: 375, height: 340)
        }
    }
    
}
