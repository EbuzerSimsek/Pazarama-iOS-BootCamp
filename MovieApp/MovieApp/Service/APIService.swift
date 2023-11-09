import Foundation

struct APIService : MovieService {
    
    func fetchMovies(completion: @escaping (Result<Movies, Error>) -> Void) {
        
        if let url = URL(string: "https://www.omdbapi.com/?i=tt3896198&apikey=324710fc&s=title") {
            
            let request = URLRequest(url: url)

            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                if let data = data {
                    do {
                       
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(Movies.self, from: data)
                        completion(.success(movies))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }

            task.resume()
        }
    }
    
    
    
    
    
    
    func fetchMoviesByName(MovieName: String, completion: @escaping (Result<Movies, Error>) -> Void) {
        
        if let url = URL(string: "https://www.omdbapi.com/?s=\(MovieName)&apikey=324710fc") {
            
            let request = URLRequest(url: url)

            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                if let data = data {
                    do {
                        
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(Movies.self, from: data)
                        completion(.success(movies))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }

            task.resume()
        }
    }
    
    
    
    func fetchMovie(MovieName: String, completion: @escaping (Result<Movie, Error>) -> Void) {
        
        
        
        if let url = URL(string: "https://www.omdbapi.com/?t=\(MovieName)&apikey=324710fc") {
            let request = URLRequest(url: url)

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    // Hata durumunda bir Error nesnesi döndür
                    completion(.failure(error))
                
                    return
                }

                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let movie = try decoder.decode(Movie.self, from: data)
                        if movie.poster.isEmpty {
                            // "Poster" alanı eksikse, bir hata döndürün
                            let error = NSError(domain: "YourAppErrorDomain", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Poster data is missing"])
                            completion(.failure(error))
                            print(error.localizedDescription)
                        } else {
                            // Başarılı durumda veriyi döndür
                            completion(.success(movie))
                            
                        }
                    } catch {
                        // JSON verileri ile ilgili bir ayrıştırma hatası
                        completion(.failure(error))
                        
                        
                    }
                }
            }

            task.resume()
        }
    }

    
}








