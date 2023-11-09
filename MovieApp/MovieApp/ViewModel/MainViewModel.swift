//
//  MainViewModel.swift
//  MovieApp
//
//  Created by Ebuzer Şimşek on 6.11.2023.
//

import Foundation

class MainViewModel {
    
    let movieService : MovieService
    
    weak var output : MainViewModelOutput?
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }
    
    
    
    
    func fetchMovies() {
        
        movieService.fetchMovies { result in
            switch result {
            case.success(let movies):
                self.output?.updateView(movies: movies.search)
            case .failure(_):
                print("Error")
            }
        }
        
    }
    
    
    func fetchMovieswithNames(MovieName:String) {
        
        movieService.fetchMoviesByName(MovieName: MovieName) { result in
            switch result {
            case.success(let movies):
                self.output?.updateViewWithMovieName(movies: movies.search)
            case .failure(_):
                print("Error")
            }
        }
        
    }
    
    func fetchMovieWithName(MovieName:String) {
        movieService.fetchMovie(MovieName: MovieName) { result in
            switch result {
            case.success(let movie):
                self.output?.updateViewWithOneMovie(movie: movie)
            case .failure(_):
                print("Bastığın hücredeki filmi çekemedim")
            }
        }
        
        
        
    }
}







