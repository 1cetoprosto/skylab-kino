//
//  MoviesViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.03.2023.
//

import Foundation

class MoviesViewModel: MoviesViewModelType {
    
    private var Movies: DomainMovies?
    
    func getMovies(completion: @escaping () -> ()) {
        Movies = []
        Movies?.append(DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100, rank: 1))
        Movies?.append(DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100, rank: 2))
        Movies?.append(DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100, rank: 3))
        Movies?.append(DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100, rank: 4))
        Movies?.append(DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100, rank: 5))
        Movies?.append(DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100, rank: 6))
        
        completion()
    }
    
    func numberOfItemsInSection(for section: Int) -> Int {
        guard let Movies else { return 0 }
        
        return Movies.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> MovieItemViewModelType? {
        guard let Movies else { return nil }
        
        return MovieItemViewModel(movie: Movies[indexPath.row])
    }
}
