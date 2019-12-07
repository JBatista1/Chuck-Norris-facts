//
//  UIViewController+dismissKeyboard.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 07/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

