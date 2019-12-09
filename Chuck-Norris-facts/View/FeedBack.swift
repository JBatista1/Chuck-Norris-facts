//
//  FeedBack.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 08/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit

class FeedBack: UIView {
    
    // MARK: - Properties
    let feedBackImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let feedBackText: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .feedbackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(frame: CGRect, text: String, image: UIImage ) {
        super.init(frame: frame)
        feedBackImage.image = image
        feedBackText.text = text
        setupViews()
        setupConstraints()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension FeedBack: CodeView{
    func setupViews() {
        addSubview(feedBackImage)
        addSubview(feedBackText)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            feedBackImage.widthAnchor.constraint(equalToConstant: 180),
            feedBackImage.heightAnchor.constraint(equalToConstant: 180),
            feedBackImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            feedBackImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        
        ])
        
        NSLayoutConstraint.activate([
            feedBackText.topAnchor.constraint(equalTo: feedBackImage.bottomAnchor, constant: 25),
            feedBackText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            feedBackText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    
    
}
