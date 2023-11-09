//
//  ViewController.swift
//  MovieApp
//
//  Created by Ebuzer Şimşek on 6.11.2023.
//

import UIKit
import Kingfisher


class HomeVC: UIViewController , MainViewModelOutput {
    
    
    
    var movies = [Search]()
    var updatedMovies = [Search]()
    var output : MainViewModelOutput?
    let viewModel : MainViewModel!
    var searchTimer: Timer?
    var chosenMovie : Movie?
    var updatedChosenMovie : Movie?
    
    
    
    var movieTablView : UITableView = {
        var table = UITableView()
        table.backgroundColor = UIColor(red: 31/255, green: 41/255, blue: 47/255, alpha: 1.0)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    let searchBar: UISearchBar =  {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .red
        searchBar.tintColor = .red
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.leftView?.tintColor = .red
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 12.0)
        ]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: placeholderAttributes)
        
        
        searchBar.layer.cornerRadius = 17.0
        searchBar.layer.masksToBounds = true
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 17.0
            textField.layer.masksToBounds = true
        }
        
        
        return searchBar
    }()
    
    
    
    
    init(viewModel: MainViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()
    }
    
    
    
    
    
    
    func SetupUI(){
        
        
        view.addSubview(searchBar)
        view.addSubview(movieTablView)
        view.backgroundColor = UIColor(red: 31/255, green: 41/255, blue: 47/255, alpha: 1.0)
        viewModel.output = self
        viewModel.fetchMovies()
        searchBar.delegate = self
        movieTablView.delegate = self
        movieTablView.dataSource = self
        movieTablView.register(MovieCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            
            
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            
            
            movieTablView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            movieTablView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieTablView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieTablView.topAnchor.constraint(equalTo: searchBar.bottomAnchor)
            
        ])
        
        
    }
    
    
    
    func downloadImageWithKingfisher(from urlString: String, imageView: UIImageView) {
        if let url = URL(string: urlString) {
            imageView.kf.setImage(with: url)
        }
    }
    
    
    
    
}


extension HomeVC: UISearchBarDelegate {
    
    
    func updateView(movies: [Search]) {
        DispatchQueue.main.async {
            if self.searchBar.text?.isEmpty == true {
                self.updatedMovies = movies
                DispatchQueue.main.async {
                    self.movieTablView.reloadData()
                }
            }
        }
    }
    
    
    func updateViewWithMovieName(movies: [Search]) {
        self.updatedMovies = movies
        
    }
    
    
    func updateViewWithOneMovie(movie: Movie) {
        self.updatedChosenMovie = movie
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] timer in
            guard self != nil else { return }
        }
        
        self.viewModel.fetchMovieswithNames(MovieName: searchText)
        self.updatedMovies = self.movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        self.updatedChosenMovie = chosenMovie
        
        DispatchQueue.main.async {
            self.movieTablView.reloadData()
        }
    }
}


