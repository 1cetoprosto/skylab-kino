//
//  NetworkService.swift
//  Homework 9.2 @leosing
//
//  Created by Леонід Квіт on 07.01.2023.
//

// import Foundation

import Alamofire

class NetworkService {
    
    // static let shared = NetworkService()
    
    // MARK: - Lifecycle
    private init() {}
    
    func fetchMovieDetails(id: Int, completion: @escaping (TMDBMovieModel) -> Void) {
        let endpoint = Endpoint.movieDetails(id: id)
        NetworkManager.shared.request(endpoint) { (result: Result<TMDBMovieModel, Error>) in
            switch result {
            case .success(let movie):
                completion(movie)
                print("Movie title: \(movie.title)")
                print("Movie overview: \(movie.overview)")
                print("Movie release date: \(movie.releaseDate)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func fetchGenres(completion: @escaping (TMDBGenresModel) -> Void) {
        let endpoint = Endpoint.genre
        NetworkManager.shared.request(endpoint) { (result: Result<TMDBGenresModel, Error>) in
            switch result {
            case .success(let genre):
                completion(genre)
                print("genres: \(genre.genres)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func fetchPopularMovies(page: Int, completion: @escaping (TMDBMoviesModel) -> Void) {
        let endpoint = Endpoint.popularMovies(page: page)
        NetworkManager.shared.request(endpoint) { (result: Result<TMDBMoviesModel, Error>) in
            switch result {
            case .success(let movie):
                completion(movie)
                print("Movie title: \(movie.results)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func fetchPopularMoviesWithGenres(genreId: Int, page: Int, completion: @escaping (TMDBMoviesModel) -> Void) {
        // let endpoint = Endpoint.popularMovies(page: page)
        let request = AF.request("https://api.themoviedb.org/3/discover/movie?api_key=f6454f589d9354f69c4998388e8a31fd&with_genres=878&sort_by=popularity.desc&language=uk&page=\(page)")
        
        request.responseDecodable(of: TMDBMoviesModel.self) { (response) in
            guard let movie = response.value else { return }
            completion(movie)
        }
    }
}
