//
//  MovieCell.swift
//  MovieApp
//
//  Created by Ebuzer Şimşek on 6.11.2023.
//

import UIKit

class MovieCell: UITableViewCell {
    
    
    var MovieName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    
    var MovieDate : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    
    var MovieImage : UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 31/255, green: 41/255, blue: 47/255, alpha: 1.0)
        contentView.addSubview(MovieName)
        contentView.addSubview(MovieImage)
        contentView.addSubview(MovieDate)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            
            MovieName.leadingAnchor.constraint(equalTo: MovieImage.trailingAnchor, constant: 15),
            MovieName.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 30),
            MovieName.heightAnchor.constraint(equalToConstant: 60),
            MovieName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            MovieDate.leadingAnchor.constraint(equalTo: MovieImage.trailingAnchor, constant: 15),
            MovieDate.topAnchor.constraint(equalTo: MovieName.bottomAnchor,constant: 10),
            
            
            
            MovieImage.leadingAnchor.constraint(equalTo:contentView.leadingAnchor,constant: 40),
            MovieImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            MovieImage.widthAnchor.constraint(equalToConstant: 130),
            MovieImage.heightAnchor.constraint(equalToConstant: 180),
            
        ])
        
    }
    
    
    
}
