//
//  Home.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 26/11/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit
import RxSwift
class Home: UIView {
    
    // MARK: - Properties
    lazy var factsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension Home: CodeView{
    func setupViews() {
        self.addSubview(factsTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            factsTableView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            factsTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            factsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            factsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    
}
