//
//  SearchFact.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 02/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit

class SearchFact: UIView {
    
    // MARK: - Properties
    let title: UILabel = {
        let font = UIFont.systemFont(ofSize: 32, weight: .light)
        let label = UILabel()
        label.text = "Want you looking for a Chuck Norris?"
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    let search : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.makeRoundBorder(withCornerRadius: 20)
        textField.backgroundColor = .searchColor
        return textField
    }()
    let buttonSearch : UIButton = {
        let button = UIButton()
        button.setTitle("Searchig", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    let buttonCancel : UIButton = {
        let button =  UIButton()
        return button
    }()
    
    let viewModal: UIView = {
        let view = UIView()
        view.makeRoundBorder(withCornerRadius: 20)
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        backgroundColor = .init(white: 0, alpha: 0)
        //        backgroundColor = .red
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchFact: CodeView {
    func setupViews() {
        addSubview(viewModal)
        viewModal.addSubview(search)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            viewModal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            viewModal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            viewModal.heightAnchor.constraint(equalToConstant: 280),
            viewModal.topAnchor.constraint(equalTo: topAnchor, constant: 100)
            
        ])
        NSLayoutConstraint.activate([
            search.bottomAnchor.constraint(equalTo: viewModal.bottomAnchor, constant: -100),
            search.leadingAnchor.constraint(equalTo: viewModal.leadingAnchor, constant: 15),
            search.trailingAnchor.constraint(equalTo: viewModal.trailingAnchor, constant: -15),
            search.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    
}
