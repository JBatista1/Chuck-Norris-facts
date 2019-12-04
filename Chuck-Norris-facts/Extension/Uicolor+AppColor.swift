//
//  Uicolor+AppColor.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 26/11/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit
extension UIColor {
    public static var categoryColor = UIColor(red: 72, green: 162, blue: 248)
    
    public static var titleNavBarColor: UIColor {
        let color = UIColor(named: "titleNavBarColor") ?? .black
        return color
    }
    public static var cardViewColor: UIColor {
        let color = UIColor(named: "cardViewColor") ?? .black
        return color
    }
    public static var navBarColor: UIColor {
        let color = UIColor(named: "navBarColor") ?? UIColor(red: 128, green: 128, blue: 200)
        return color
    }
    public static var searchColor: UIColor {
        let color = UIColor(named: "searchColor") ?? UIColor(red: 238, green: 238, blue: 238)
        return color
    }
    public static var textColor: UIColor {
        let color = UIColor(named: "textColor") ?? UIColor(red: 0, green: 0, blue: 0)
        return color
    }
    public static var buttonColor: UIColor {
        let color = UIColor(named: "buttonColor") ?? UIColor(red: 0, green: 0, blue: 0)
        return color
    }
    public static var textButtonColor: UIColor {
        let color = UIColor(named: "textButtonColor") ?? .black
        return color
    }
    public static var borderButtonColor: UIColor {
        let color = UIColor(named: "borderButton") ?? .black
        return color
    }
  
    
    
}
