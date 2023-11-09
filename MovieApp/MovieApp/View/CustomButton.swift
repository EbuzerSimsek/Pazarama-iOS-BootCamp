//
//  CustomButton.swift
//  MovieApp
//
//  Created by Ebuzer Şimşek on 7.11.2023.
//

import UIKit

class CustomButton: UIButton {
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        return imageView
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    func setup(image: UIImage?, text: String) {
        if let image = image {
            iconImageView.image = image
            addSubview(iconImageView)
        }
        
        textLabel.text = text
        addSubview(textLabel)
        
        
        
        
        NSLayoutConstraint.activate([
            
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor,constant: -10),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.60),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            
            
            
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            textLabel.centerYAnchor.constraint(equalTo:centerYAnchor),
            textLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor,constant: 11)
        ])
    }
}

