//
//  Top5MoviesViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 19.03.2023.
//

import Foundation

class Top5MoviesViewModel: Top5MoviesViewModelType {
    
    private var movies: DomainMovies?
    
    func getTop5Movies() {
        loadMoviesFromJSON { [weak self] movies in
            if let movies {
                self?.movies = movies
            } else {
                self?.movies = []
            }
        }
    }
    
    func loadMoviesFromJSON(completion: @escaping ([DomainMovie]?) -> Void) {
        guard let fileURL = Bundle.main.url(forResource: "Top5Movies", withExtension: "json") else {
            print("JSON file not found.")
            completion(nil)
            return
        }

        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let movies = try decoder.decode([DomainMovie].self, from: jsonData)
            completion(movies)
        } catch {
            print("Failed to parse JSON: \(error)")
            completion(nil)
        }
    }
    
    func numberOfItemsInSection(for section: Int) -> Int {
        guard let movies else { return 0 }
        
        return movies.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> MovieItemViewModelType? {
        guard let movies else { return nil }
        
        return MovieItemViewModel(movie: movies[indexPath.row])
    }
}
