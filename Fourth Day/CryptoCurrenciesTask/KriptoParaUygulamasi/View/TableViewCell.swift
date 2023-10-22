//
//  TableViewCell.swift
//  KriptoParaUygulamasi
//
//  Created by Ebuzer Şimşek on 21.10.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var cellLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

     
       
        contentView.addSubview(cellLabel)
        contentView.addSubview(cellLabel2)
        

        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setupConstraints() {
        

        NSLayoutConstraint.activate([
           
            cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            cellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -31),
            cellLabel.heightAnchor.constraint(equalToConstant: 18),
    //        cellLabel.widthAnchor.constraint(equalToConstant: 111),
    //        cellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
           
            
            
            
            cellLabel2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellLabel2.leadingAnchor.constraint(equalTo: cellLabel.trailingAnchor, constant: -250),
//            cellLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -31),

          
            
    //        cellLabel2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            
        ])
        
        
        

        
    }
    
    

}


