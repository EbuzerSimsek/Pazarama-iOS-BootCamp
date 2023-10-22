//
//  ViewController.swift
//  KriptoParaUygulamasi
//
//  Created by Atil Samancioglu on 21.10.2023.
//  Task Completed by EBUZER ŞİMŞEK

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private let tableView : UITableView = {
        let tabel = UITableView()
        return tabel
    }()
    
    
    private let activityIndicator : UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        return ai
    }()
    
    
    var cryptoList = [Crypto]()
    let disposeBag = DisposeBag()
    
    let cryptoVM = CryptoViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Cryptos"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupBindings()
        cryptoVM.requestData()
        setupUI()
    }
    
    
    
    
    private func setupUI(){
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: 200),
            activityIndicator.widthAnchor.constraint(equalToConstant: 20),
            
        ])
        
        
    }
    
    
    
    private func setupBindings() {
        
        cryptoVM
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { cryptos in
                self.cryptoList = cryptos
                self.tableView.reloadData()
            }.disposed(by: disposeBag)
        
        
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
                print(error)
            }.disposed(by: disposeBag)
        
        
        cryptoVM
            .loading
            .bind(to: self.activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        
        cryptoVM
            .loading
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { bool in
                print(bool)
            }.disposed(by: disposeBag)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        cell.cellLabel.text = "\(cryptoList[indexPath.row].currency):"
        cell.cellLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cell.cellLabel2.text = cryptoList[indexPath.row].price
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}

