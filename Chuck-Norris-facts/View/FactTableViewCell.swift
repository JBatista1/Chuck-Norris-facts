//
//  FactTableViewCell.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 26/11/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit

class FactTableViewCell: UITableViewCell {
    
    let sharingIcon = UIImage(named: "sharing")
    let sharingIconClicked = UIImage(named: "sharingClicked")
    
    //MARK: - Properties
    
    lazy var factLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .textColor

        label.font = UIFont.boldSystemFont(ofSize: 17)

        return label
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .categoryColor
        label.text = "Tecnology".uppercased()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.makeRoundBorder(withCornerRadius: 12.5)
        return label
    }()
    
    lazy var sharingButton : UIButton = {
        let button = UIButton()
        button.setImage(self.sharingIcon, for: .normal)
        button.setImage(self.sharingIconClicked, for: .highlighted)
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var cardView : UIView = {
        let offset = CGSize(width: 0, height: 0)
        let view = UIView()
        view.backgroundColor = .cardViewColor
    
        view.setShadowAndCornerRadius(withColor: .black, Offset: offset, Opacity: 0.3, Radius: 3, andCornerRadius: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupViews()
        setupConstraints()
        self.backgroundColor = .systemBackground
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
extension FactTableViewCell: CodeView{
    func setupViews() {
        
        addSubview(cardView)
        
        cardView.addSubview(factLabel)
        cardView.addSubview(categoryLabel)
        cardView.addSubview(sharingButton)

    }
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            factLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            factLabel.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: -20),
            factLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            factLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            categoryLabel.leadingAnchor.constraint(equalTo: factLabel.leadingAnchor, constant: -5),
            categoryLabel.heightAnchor.constraint(equalToConstant: 25),
            categoryLabel.widthAnchor.constraint(equalToConstant: 120),
        ])
//
        NSLayoutConstraint.activate([
            sharingButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            sharingButton.trailingAnchor.constraint(equalTo: factLabel.trailingAnchor, constant: -10),
            sharingButton.heightAnchor.constraint(equalToConstant: 25),
            sharingButton.widthAnchor.constraint(equalToConstant: 25)

        ])
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
          
        
        ])
    }
    
    
}
