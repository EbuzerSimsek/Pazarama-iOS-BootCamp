//
//  ViewController.swift
//  scrollViewProgrammatic
//
//  Created by Ebuzer Şimşek on 17.10.2023.
//

import UIKit

class MenuVC: UIViewController {
    
    
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .white
        return sv
    }()
    
    let contentView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    
    let tableView2: UITableView = {
        let table = UITableView()
        return table
    }()
    
    let GreetingLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 20)
        lab.text = "Good Morning Akila!"
        lab.sizeToFit()
        return lab
    }()
    
    
    let RecentItemsLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.boldSystemFont(ofSize: 28)
        lab.text = "Recent Items"
        lab.sizeToFit()
        return lab
    }()
    
    let MostPopularLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.boldSystemFont(ofSize: 24)
        lab.text = "Most Popular"
        lab.sizeToFit()
        return lab
    }()
    
    let PopularRestaurantsLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 28)
        lab.text = "Popular Restaurants"
        lab.sizeToFit()
        return lab
    }()
    
    
    let CurrentLocationLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 20)
        lab.text = "Current Location"
        lab.sizeToFit()
        return lab
    }()
    
    
    let DeliveringToLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.textColor = UIColor.systemGray
        lab.text = "Delivering to"
        lab.sizeToFit()
        return lab
    }()
    
    
    var BoxImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "box")
        return image
    }()
    
    
    var searchBar : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "searchBar")
        return image
    }()
    
    
    var viewAll : UILabel = {
        let label = UILabel()
        label.text = "View all"
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var viewAll2 : UILabel = {
        let label = UILabel()
        label.text = "View all"
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var viewAll3 : UILabel = {
        let label = UILabel()
        label.text = "View all"
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: 88, height: 114) // İstediğiniz boyutları belirleyin
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    
    var collectionView2: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 250, height: 150)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupCollectionView()
        SetupCollectionView2()
        SetupTableView1()
        SetupTableView2()
        setupUI()
        
    }
    
    
    private func setupUI() {
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(viewAll)
        viewAll.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(viewAll2)
        viewAll2.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(viewAll3)
        viewAll3.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(GreetingLabel)
        GreetingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(RecentItemsLabel)
        RecentItemsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(MostPopularLabel)
        MostPopularLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(PopularRestaurantsLabel)
        PopularRestaurantsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(BoxImage)
        BoxImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(CurrentLocationLabel)
        CurrentLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(DeliveringToLabel)
        DeliveringToLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(100)
        
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 2.33),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 880),
            tableView.bottomAnchor.constraint(equalTo: MostPopularLabel.bottomAnchor,constant: -45),
            
            
            
            collectionView.heightAnchor.constraint(equalToConstant: 135),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            collectionView.widthAnchor.constraint(equalToConstant: 400),
            collectionView.bottomAnchor.constraint(equalTo: PopularRestaurantsLabel.topAnchor, constant: -30),
            
            
            collectionView2.heightAnchor.constraint(equalToConstant: 240),
            collectionView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView2.widthAnchor.constraint(equalToConstant: 400),
            collectionView2.bottomAnchor.constraint(equalTo: RecentItemsLabel.topAnchor, constant: -15),
            
            
            tableView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView2.heightAnchor.constraint(equalToConstant: 285),
            tableView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20),
            
            
            
            GreetingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            GreetingLabel.bottomAnchor.constraint(equalTo: DeliveringToLabel.topAnchor,constant: -25),
            
            
            
            RecentItemsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            RecentItemsLabel.bottomAnchor.constraint(equalTo: tableView2.topAnchor,constant: -20),
            
            
            MostPopularLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            MostPopularLabel.bottomAnchor.constraint(equalTo: collectionView2.topAnchor,constant: 5),
            
            
            PopularRestaurantsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            PopularRestaurantsLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor,constant: -20),
            
            
            viewAll.leadingAnchor.constraint(equalTo: PopularRestaurantsLabel.trailingAnchor,constant: 65),
            viewAll.bottomAnchor.constraint(equalTo: tableView.topAnchor,constant: -25),
            
            viewAll2.leadingAnchor.constraint(equalTo: MostPopularLabel.trailingAnchor,constant: 155),
            viewAll2.bottomAnchor.constraint(equalTo: collectionView2.topAnchor),
            
            viewAll3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            viewAll3.bottomAnchor.constraint(equalTo: tableView2.topAnchor,constant: -24),
            
            
            CurrentLocationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            CurrentLocationLabel.bottomAnchor.constraint(equalTo: searchBar.topAnchor,constant: -45),
            
            
            DeliveringToLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            DeliveringToLabel.bottomAnchor.constraint(equalTo: CurrentLocationLabel.topAnchor,constant: -5),
            
            
            BoxImage.bottomAnchor.constraint(equalTo: DeliveringToLabel.topAnchor,constant: -25),
            BoxImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -15),
            
            
            searchBar.heightAnchor.constraint(equalToConstant: 45),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            searchBar.widthAnchor.constraint(equalToConstant: 350),
            searchBar.bottomAnchor.constraint(equalTo: collectionView.topAnchor,constant: -20),
            
            
            
            
        ])
    }
    
}





