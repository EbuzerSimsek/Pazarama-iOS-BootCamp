//
//  MovieAppTests.swift
//  MovieAppTests
//
//  Created by Ebuzer Şimşek on 6.11.2023.
//

import XCTest
@testable import MovieApp

final class MovieAppTests: XCTestCase {
    private var mainViewModel : MainViewModel!
    private var movieService : MockMovieService!
    private var output : MockMainViewModelOutput!
    
    
    override func setUpWithError() throws {
        movieService = MockMovieService()
        mainViewModel = MainViewModel(movieService: movieService)
        output = MockMainViewModelOutput()
        mainViewModel.output = output
    }

    override func tearDownWithError() throws {
        
    }

    
    func testUpdateView_whenAPISucces_showsMoviesTitles() throws {
        let mockMovies = Movies(search: [Search(title: "Breaking", year: "2019", imdbID: "9.6", type:  TypeEnum(rawValue: "movie")!, poster: "https://example.com/poster.jpg")], totalResults: "", response: "")
       
        
        movieService.fetchMoviesMockResult = .success(mockMovies)
        
        mainViewModel.fetchMovies()
        
        XCTAssertEqual(output.updateViewArray.first?.title, "Breaking")
        XCTAssertEqual(output.updateViewArray.first?.year, "2019")
        XCTAssertEqual(output.updateViewArray.first?.imdbID, "9.6")
        
    }
    
    
    func testUpdateView_whenAPIFailure_showsNoMovie() throws {
        
    }


    

}


class MockMovieService : MovieService {
    
    var fetchMoviesMockResult : Result<MovieApp.Movies, Error>?
    var fetchMoviesByNameMockResult : Result<MovieApp.Movies, Error>?
    var fetchMovieMockResult : Result<MovieApp.Movie, Error>?
    
    func fetchMovies(completion: @escaping (Result<MovieApp.Movies, Error>) -> Void) {
        if let result = fetchMoviesMockResult {
            completion(result)
        }
    }
    
    func fetchMoviesByName(MovieName: String, completion: @escaping (Result<MovieApp.Movies, Error>) -> Void) {
        if let result = fetchMoviesByNameMockResult {
            completion(result)
        }
    }
    
    func fetchMovie(MovieName: String, completion: @escaping (Result<MovieApp.Movie, Error>) -> Void) {
        if let result = fetchMovieMockResult {
            completion(result)
        }
    }
    
    
}


class MockMainViewModelOutput: MainViewModelOutput {
    var updateViewArray: [MovieApp.Search] = []
    var updateViewWithMovieNameArray : [MovieApp.Search] = []
    var updateViewWithOneMovieCalled : MovieApp.Movie?

    func updateView(movies: [MovieApp.Search]) {
        updateViewArray = movies
    }

    func updateViewWithMovieName(movies: [MovieApp.Search]) {
        updateViewWithMovieNameArray = movies
    }

    func updateViewWithOneMovie(movie: MovieApp.Movie) {
        updateViewWithOneMovieCalled = movie
    }
}

