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
        guard let color = UIColor(named: "titleNavBarColor") else {
            return .black
        }
        return color
    }
    
    public static var navBarColor: UIColor {
        guard let color = UIColor(named: "navBarColor") else {
            return UIColor(red: 128, green: 128, blue: 200)
        }
        return color
    }
    public static var searchColor: UIColor {
          guard let color = UIColor(named: "searchColor") else {
              return UIColor(red: 238, green: 238, blue: 238)
          }
          return color
      }

}
