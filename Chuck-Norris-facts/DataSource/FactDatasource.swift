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
    var tableView: UITableView?
    fileprivate let cellId = "id"
    
    required init(items: [Fact], tableView: UITableView) {
        self.items = items
        self.tableView = tableView
        super.init()
        tableView.register(FactTableViewCell.self, forCellReuseIdentifier: cellId)
        self.setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! FactTableViewCell
        let factSettings = FactSettings(fact: self.items[indexPath.row])
        cell.setup(fact: factSettings.getFact(), sizeFact: factSettings.getSizeText())
        
        return cell
        
    }
    
    
    
}

