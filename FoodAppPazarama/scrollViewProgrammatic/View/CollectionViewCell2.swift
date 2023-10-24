//
//  CollectionViewCell2.swift
//  scrollViewProgrammatic
//
//  Created by Ebuzer Şimşek on 18.10.2023.
//

import UIKit

class CustomCollectionViewCell2: UICollectionViewCell {
    
    var imageView = UIImageView()
    
    
    var starImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    
    
    let label: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Metropolis", size: 14)
        lab.font = UIFont.boldSystemFont(ofSize: 14)
        lab.text = "test"
        return lab
    }()
    
    
    var restaurantType : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var cuisine : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ranking : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(label)
        addSubview(restaurantType)
        addSubview(cuisine)
        addSubview(starImage)
        addSubview(ranking)
        
        
        
        imageView.frame = bounds
        imageView.frame = CGRect(x: 0, y: 0, width: 228, height: 135)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 21).isActive = true
        
        imageView.heightAnchor.constraint(equalToConstant: 135).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 228).isActive = true
        
        
        
        
        restaurantType.translatesAutoresizingMaskIntoConstraints = false
        restaurantType.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        restaurantType.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21).isActive = true
        
        
        
        
        
        starImage.widthAnchor.constraint(equalToConstant: 14).isActive = true
        starImage.heightAnchor.constraint(equalToConstant: 14).isActive = true
        starImage.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        starImage.trailingAnchor.constraint(equalTo: cuisine.trailingAnchor, constant: 18).isActive = true
        
        
        ranking.translatesAutoresizingMaskIntoConstraints = false
        ranking.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        ranking.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 5).isActive = true
        
        
        
        
        cuisine.translatesAutoresizingMaskIntoConstraints = false
        cuisine.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        cuisine.leadingAnchor.constraint(equalTo: restaurantType.trailingAnchor, constant: 5).isActive = true
        
        
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor, constant: 147).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
