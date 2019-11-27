//
//  HomeViewController.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 26/11/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    fileprivate let cellId = "id"
    let customView = Home()
    private var addBarButtonItem: UIBarButtonItem?
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.factsTableView.delegate = self
        customView.factsTableView.dataSource = self
        customView.factsTableView.separatorStyle = .none
        customView.factsTableView.register(FactTableViewCell.self, forCellReuseIdentifier: cellId)
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! FactTableViewCell
        cell.factLabel.text = "Chuck Noris, Jesus, and Barack Obama were standing by a lake. Jesus walked out on the water and was shortly followed by Chuck. Obama tried to follow, but fell in the water. After muck kicking and splashing Jesus said. Do you think we should tell him about the “stepping stone”? Chuck then said: “What stepping stone?"
        cell.sharingButton.addTarget(self, action: #selector(shraing), for: .touchDown)
        return cell
    }
    @objc func shraing() {
        print("Existo")
    }
    
    
}
