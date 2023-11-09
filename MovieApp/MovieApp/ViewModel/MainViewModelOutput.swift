//
//  MainViewModelOutput.swift
//  MovieApp
//
//  Created by Ebuzer Şimşek on 6.11.2023.
//

import Foundation

protocol MainViewModelOutput : AnyObject {
    
    func updateView(movies: [Search])
    func updateViewWithMovieName(movies : [Search])
    func updateViewWithOneMovie(movie : Movie)
    
}
