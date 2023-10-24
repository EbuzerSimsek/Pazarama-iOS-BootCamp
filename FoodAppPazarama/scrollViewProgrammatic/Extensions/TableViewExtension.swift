//
//  TableViewExtension.swift
//  scrollViewProgrammatic
//
//  Created by Ebuzer Şimşek on 23.10.2023.
//

import Foundation
import UIKit


extension MenuVC : UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    func SetupTableView1(){
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "TableCell1")
        
        contentView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
    }
    
    
    
    
    
    func SetupTableView2(){
        
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView2.register(CustomTableViewCell2.self, forCellReuseIdentifier: "TableCell2")
        
        contentView.addSubview(tableView2)
        tableView2.translatesAutoresizingMaskIntoConstraints = false
        tableView2.separatorStyle = .none
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
        case self.tableView :
            return PopularRestaurantsShared.shared.PopularRestaurantsDatas.count
        case tableView2 :
            return RecentItemsShared.shared.recentItemsDatas.count
        default:
            return 0
        }
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView {
        case self.tableView :
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell1", for: indexPath) as! CustomTableViewCell
            cell.cellLabel.text = PopularRestaurantsShared.shared.PopularRestaurantsDatas[indexPath.row].title
            cell.cellLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.cellLabel.textColor = UIColor.darkGray
            cell.cellLabel2.text = "(124 ratings) Cafe"
            cell.cellLabel2.font = UIFont.systemFont(ofSize: 12)
            cell.cellLabel2.textColor = UIColor.gray
            cell.cellImageView.image = UIImage(named: PopularRestaurantsShared.shared.PopularRestaurantsDatas[indexPath.row].imageName)
            cell.starImage.image = UIImage(named: "star")
            cell.starImage.tintColor = .black
            cell.rankingLabel.textColor = .orange
            cell.rankingLabel.font = UIFont.systemFont(ofSize: 13)
            cell.rankingLabel.text = PopularRestaurantsShared.shared.PopularRestaurantsDatas[indexPath.row].ranking
            
            return cell
            
        case tableView2 :
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell2", for: indexPath) as! CustomTableViewCell2
            cell.cellLabel.text = RecentItemsShared.shared.recentItemsDatas[indexPath.row].title
            cell.restaurantType.text = RecentItemsShared.shared.recentItemsDatas[indexPath.row].restaurantType
            cell.cuisine.text = RecentItemsShared.shared.recentItemsDatas[indexPath.row].cuisine
            cell.ranking.text = RecentItemsShared.shared.recentItemsDatas[indexPath.row].ranking
            cell.cellImageView.image = UIImage(named: RecentItemsShared.shared.recentItemsDatas[indexPath.row].imageName)
            cell.cellLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.cuisine.font = UIFont.systemFont(ofSize: 12)
            cell.cuisine.textColor = UIColor.gray
            cell.ranking.textColor = UIColor.gray
            cell.restaurantType.textColor = UIColor.gray
            cell.ranking.font = UIFont.systemFont(ofSize: 12)
            cell.ranking.textColor = .orange
            cell.restaurantType.font = UIFont.systemFont(ofSize: 12)
            cell.starImage.image = UIImage(named: "star")
            return cell
            
            
            
        default:
            return UITableViewCell()
        }
        
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch tableView {
        case self.tableView :
            return 295
        case tableView2 :
            return 95
        default:
            return 0
        }
    }
}
