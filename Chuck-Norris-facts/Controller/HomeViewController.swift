//
//  HomeViewController.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 26/11/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let customView = Home()
    private var addBarButtonItem: UIBarButtonItem?
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.factsTableView.delegate = self
        customView.factsTableView.dataSource = self
        
        setupNavigation()
    }
    
    override func loadView() {
        view = customView
    }
    
    // MARK: - Navigation
    private func setupNavigation() {
        title = "Chuck Norris Facts"
        addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(searchFact))
        navigationItem.rightBarButtonItem = addBarButtonItem
        navigationController?.view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    @objc func searchFact(_ sender: UIBarButtonItem) {
        print("Clicked")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}
