//
//  ItemsTableViewDatasource.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 08/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit

protocol ItemsTableViewDatasource: UITableViewDataSource {
    associatedtype T
    var items:[T] {get}
    var tableView: UITableView? {get}
    var delegate: UITableViewDelegate? {get}
    
    init(items: [T], tableView: UITableView, delegate: UITableViewDelegate)
    
    func setupTableView()
}

extension ItemsTableViewDatasource {
    func setupTableView() {
        self.tableView?.dataSource = self
        self.tableView?.reloadData()
    }
}
