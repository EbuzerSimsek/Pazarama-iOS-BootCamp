//
//  CollectionViewExtension.swift
//  scrollViewProgrammatic
//
//  Created by Ebuzer Şimşek on 23.10.2023.
//

import Foundation
import UIKit

extension MenuVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    func SetupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: 88, height: 114)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell1")
        collectionView.showsHorizontalScrollIndicator = false
        
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    
    
    func SetupCollectionView2() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 250, height: 150)
        layout.scrollDirection = .horizontal
        
        collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView2.dataSource = self
        collectionView2.delegate = self
        
        collectionView2.register(CustomCollectionViewCell2.self, forCellWithReuseIdentifier: "CustomCell2")
        
        contentView.addSubview(collectionView2)
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        collectionView2.showsHorizontalScrollIndicator = false
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case self.collectionView :
            return KitchenTypesShared.shared.KitchenTypesDatas.count
        case collectionView2 :
            return MostPopularShared.shared.MostPopularDatas.count
        default:
            return 0
        }
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            
        case self.collectionView :
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell1", for: indexPath) as! CustomCollectionViewCell
            cell.imageView.image = UIImage(named: KitchenTypesShared.shared.KitchenTypesDatas[indexPath.item].imageName)
            cell.label.text = KitchenTypesShared.shared.KitchenTypesDatas[indexPath.item].title
            return cell
            
            
        case collectionView2 :
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell2", for: indexPath) as! CustomCollectionViewCell2
            cell.imageView.image = UIImage(named: MostPopularShared.shared.MostPopularDatas[indexPath.item].imageName)
            cell.label.text = MostPopularShared.shared.MostPopularDatas[indexPath.item].title
            cell.restaurantType.text = MostPopularShared.shared.MostPopularDatas[indexPath.item].restaurantType
            cell.cuisine.text = MostPopularShared.shared.MostPopularDatas[indexPath.item].cuisine
            cell.ranking.text = MostPopularShared.shared.MostPopularDatas[indexPath.item].ranking
            cell.label.font = UIFont.boldSystemFont(ofSize: 18)
            cell.starImage.image = UIImage(named: "star")
            cell.cuisine.font = UIFont.systemFont(ofSize: 12)
            cell.cuisine.textColor = UIColor.gray
            cell.ranking.textColor = UIColor.gray
            cell.restaurantType.textColor = UIColor.gray
            cell.ranking.font = UIFont.systemFont(ofSize: 12)
            cell.ranking.textColor = .orange
            cell.restaurantType.font = UIFont.systemFont(ofSize: 12)
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width / 2.0
        let cellHeight = collectionView.frame.height / 2.0
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
}
