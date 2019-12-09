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
        let font = UIFont.systemFont(ofSize: 27, weight: .light)
        let label = UILabel()
        label.text = "Want you looking for a Chuck Norris?"
        label.font = font
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let search : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Searching..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .asciiCapable
        return textField
    }()
    
    let buttonSearch : UIButton = {
        let button = UIButton()
        button.setTitle("Searching", for: .normal)
        button.setTitleColor(.textButtonColor, for: .normal)
        button.setTitleColor(.systemGray2, for: .highlighted)
        button.backgroundColor = .buttonColor
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.borderButtonColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.makeRoundBorder(withCornerRadius: 20)
        return button
    }()
    
    let buttonCancel : UIButton = {
        let button =  UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
    
    let viewModal: UIView = {
        let offset = CGSize(width: 0, height: 0)
        let view = UIView()
        view.setShadowAndCornerRadius(withColor: .black, Offset: offset, Opacity: 0.2, Radius: 20, andCornerRadius: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cardViewColor
        return view
    }()
    
    let viewSearch: UIView = {
        let view = UIView()
        view.makeRoundBorder(withCornerRadius: 20)
        view.backgroundColor = .searchColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.makeRoundBorder(withCornerRadius: 20)
        return view
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .init(white: 0, alpha: 0.4)
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
      
        viewModal.addSubview(buttonCancel)
        viewModal.addSubview(title)
        viewModal.addSubview(buttonSearch)
        viewModal.addSubview(viewSearch)
        viewSearch.addSubview(search)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            viewModal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            viewModal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            viewModal.bottomAnchor.constraint(equalTo: buttonSearch.bottomAnchor, constant: 16),
            viewModal.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
            
        ])
        NSLayoutConstraint.activate([
            viewSearch.leadingAnchor.constraint(equalTo: viewModal.leadingAnchor, constant: 15),
            viewSearch.trailingAnchor.constraint(equalTo: viewModal.trailingAnchor, constant: -15),
            viewSearch.bottomAnchor.constraint(equalTo: buttonSearch.topAnchor, constant: -15),
            viewSearch.heightAnchor.constraint(equalToConstant: 40)

        ])
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: viewModal.topAnchor, constant: 40),
            title.bottomAnchor.constraint(equalTo: viewSearch.topAnchor, constant: -30),
            title.leadingAnchor.constraint(equalTo: viewModal.leadingAnchor, constant: 35),
            title.trailingAnchor.constraint(equalTo: viewModal.trailingAnchor, constant: -35)
        ])
        NSLayoutConstraint.activate([
            search.topAnchor.constraint(equalTo: viewSearch.topAnchor, constant: 0),
            search.bottomAnchor.constraint(equalTo: viewSearch.bottomAnchor, constant: 0),
            search.leadingAnchor.constraint(equalTo: viewSearch.leadingAnchor, constant: 16),
            search.trailingAnchor.constraint(equalTo: viewSearch.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            buttonCancel.topAnchor.constraint(equalTo: viewModal.topAnchor, constant: 13),
            buttonCancel.trailingAnchor.constraint(equalTo: viewModal.trailingAnchor, constant: -13),
            buttonCancel.heightAnchor.constraint(equalToConstant: 23),
            buttonCancel.widthAnchor.constraint(equalToConstant: 20)

        ])
        NSLayoutConstraint.activate([
//            buttonSearch.bottomAnchor.constraint(equalTo: viewModal.bottomAnchor, constant: -16),
            buttonSearch.trailingAnchor.constraint(equalTo: viewSearch.trailingAnchor, constant: 0),
            buttonSearch.leadingAnchor.constraint(equalTo: viewSearch.leadingAnchor, constant: 0),
            buttonSearch.heightAnchor.constraint(equalToConstant: 40)

        ])

    }

    
}
