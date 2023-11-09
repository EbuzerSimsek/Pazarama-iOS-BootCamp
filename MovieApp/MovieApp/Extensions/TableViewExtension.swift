//
//  TableViewExtension.swift
//  MovieApp
//
//  Created by Ebuzer Şimşek on 9.11.2023.
//

import Foundation
import UIKit

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        searchBar.resignFirstResponder()
        let indexTitle = updatedMovies[indexPath.row].title
       
        
        
        viewModel.fetchMovieWithName(MovieName: indexTitle)
        
        let secondViewController = DetailVC()
        secondViewController.modalPresentationStyle = .overCurrentContext
        secondViewController.selectedMovie = self.updatedChosenMovie
        
        self.present(secondViewController, animated: true)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        updatedMovies.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        
        let title = updatedMovies[indexPath.row].title
        
        if !title.isEmpty {
            cell.MovieName.text = title
        } else {
            cell.MovieName.text = "No Title Available"
        }
        
        let imageUrlString = updatedMovies[indexPath.row].poster
        cell.MovieDate.text = updatedMovies[indexPath.row].year
        if !imageUrlString.isEmpty {
            
            DispatchQueue.main.async {
                self.downloadImageWithKingfisher(from: imageUrlString, imageView: cell.MovieImage)
            }
        } else {
           
            cell.MovieImage.image = UIImage(named: "placeholder_image")
        }
        
        return cell
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    
    
}
