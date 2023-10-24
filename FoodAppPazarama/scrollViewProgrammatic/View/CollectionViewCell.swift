//
//  CollectionViewCell.swift
//  scrollViewProgrammatic
//
//  Created by Ebuzer Şimşek on 17.10.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    
        let label: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Metropolis", size: 14)
        lab.font = UIFont.boldSystemFont(ofSize: 14)
        lab.textAlignment = .center
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(label)
        
        imageView.frame = bounds
        imageView.frame = CGRect(x: 0, y: 0, width: 88, height: 88)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 88).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 88).isActive = true

        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
