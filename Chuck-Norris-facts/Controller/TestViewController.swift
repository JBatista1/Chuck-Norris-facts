//
//  TestViewController.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 30/11/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
//        home.loadView()
//        home.viewDidLoad()
        
        
        
      
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()
          let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = HomeViewController()
        window.rootViewController?.view.translatesAutoresizingMaskIntoConstraints = false
        view =  window.rootViewController?.view
//        view.addSubview(home.view)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
