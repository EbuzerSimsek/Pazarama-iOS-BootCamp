//
//  MovieService.swift
//  MovieApp
//
//  Created by Ebuzer Şimşek on 6.11.2023.
//

import Foundation

protocol MovieService {
    
    func fetchMovies(completion: @escaping (Result<Movies, Error>) -> Void)
    func fetchMoviesByName(MovieName: String, completion: @escaping (Result<Movies, Error>) -> Void)
    func fetchMovie(MovieName: String, completion: @escaping (Result<Movie, Error>) -> Void)
}
