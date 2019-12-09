//
//  UIView+DesignView.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 27/11/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func makeRoundBorder(withCornerRadius corneRadius: CGFloat) {
        layer.cornerRadius = corneRadius
        layer.masksToBounds = true
    }
    
    func insertShadow(withColor color: UIColor, Offset offset: CGSize, Opacity opacity: Float, andRadius radius: CGFloat ){
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    func setShadowAndCornerRadius(withColor color: UIColor, Offset offset: CGSize, Opacity opacity: Float, Radius radius: CGFloat, andCornerRadius corneRadius: CGFloat ){
        
        layer.shadowRadius = radius
        layer.shadowColor =  color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.cornerRadius = corneRadius
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
