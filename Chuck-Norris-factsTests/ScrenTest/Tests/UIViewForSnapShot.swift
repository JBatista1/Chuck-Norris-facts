//
//  UIViewForSnapShot.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 01/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit
@testable import Chuck_Norris_facts
class UIViewForSnapShot: UIView {
    var sizeView : CGRect
    init(TypeView typeView: SizeViewTest, isPortrait portrait: Bool, withview view: UIView) {
       
        if !portrait{
            sizeView = CGRect(x: 0.0, y: 0.0, width: typeView.size.height, height: typeView.size.width)
        }else {
            sizeView = typeView.size
        }
        view.frame = sizeView
        super.init(frame: sizeView)
        self.backgroundColor = .white
        self.addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

