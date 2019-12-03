//
//  SearchFactViewController.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 02/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit

class SearchFactViewController: UIViewController {
 let customView = SearchFact()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()
        view = customView
        
    }


}
