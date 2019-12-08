//
//  FactDatasource.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 08/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit

class FactDatasource: NSObject, ItemsTableViewDatasource {
    var items: [Fact] = []
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    fileprivate let cellId = "id"
    required init(items: [Fact], tableView: UITableView, delegate: UITableViewDelegate) {
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        tableView.register(FactTableViewCell.self, forCellReuseIdentifier: cellId)
        self.setupTableView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! FactTableViewCell
        let character = self.items[indexPath.row]
        return cell
        
    }
    
    
    
}

