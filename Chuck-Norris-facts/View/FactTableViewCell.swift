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
    
    //MARK: - Properties
    
    lazy var factLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var categoryFact: UILabel = {
        let label = UILabel()
        label.backgroundColor = .categoryColor
        label.text = "Tecnology".uppercased()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sharing : UIButton = {
        let button = UIButton()
        button.setImage(self.sharingIcon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var cardViewFact : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    
}
extension FactTableViewCell: CodeView{
    func setupViews() {
        cardViewFact.addSubview(factLabel)
        cardViewFact.addSubview(categoryFact)
        addSubview(cardViewFact)
        
    }
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            factLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            factLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            factLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            factLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22)
        ])
        
        NSLayoutConstraint.activate([
            categoryFact.topAnchor.constraint(equalTo: factLabel.bottomAnchor, constant: 20),
            cardViewFact.leadingAnchor.constraint(equalTo: factLabel.leadingAnchor, constant: 0),
            categoryFact.heightAnchor.constraint(equalToConstant: 20),
            categoryFact.widthAnchor.constraint(equalToConstant: 120),
        ])
        NSLayoutConstraint.activate([
            cardViewFact.topAnchor.constraint(equalTo: factLabel.topAnchor, constant: 20),
            cardViewFact.bottomAnchor.constraint(equalTo: categoryFact.bottomAnchor, constant: 20),
            cardViewFact.leadingAnchor.constraint(equalTo: factLabel.leadingAnchor, constant: 20),
            cardViewFact.trailingAnchor.constraint(equalTo: factLabel.trailingAnchor, constant: 20)
        ])
    }
    
    
}
