//
//  FactDatasource.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 08/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit
import RxSwift
class FactDatasource: NSObject, ItemsTableViewDatasource {
    var items: [Fact] = []
    var tableView: UITableView?
    fileprivate let cellId = "id"
    var sharingFact = PublishSubject<String>()
    
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
        cell.sharingButton.tag = indexPath.row
        cell.sharingButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        
        
        return cell
        
    }
    
    func setupTableView() {
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.reloadSections([0], with: .automatic)
        self.tableView?.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
    }
    
}
extension FactDatasource: UITableViewDelegate{
    @objc func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        let textSharing = "Hey, did you know that: " + items[btnsendtag.tag].value + ". Find out more interesting facts at: https://www.apple.com/ios/app-store/"
        sharingFact.onNext(textSharing)
    }
}

