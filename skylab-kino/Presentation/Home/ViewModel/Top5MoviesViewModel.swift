//
//  Top5MoviesViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 19.03.2023.
//

import Foundation

class Top5MoviesViewModel: Top5MoviesViewModelType {
    
    private var top5Movies: DomainMovies?
    
    func getTop5Movies(completion: @escaping () -> ()) {
        top5Movies = []
        top5Movies?.append(DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100, rank: 1))
        top5Movies?.append(DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100, rank: 2))
        top5Movies?.append(DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100, rank: 3))
        top5Movies?.append(DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100, rank: 4))
        top5Movies?.append(DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100, rank: 5))
        
        completion()
    }
    
    func numberOfItemsInSection(for section: Int) -> Int {
        guard let top5Movies else { return 0 }
        
        return top5Movies.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> MovieItemViewModelType? {
        guard let top5Movies else { return nil }
        
        return MovieItemViewModel(movie: top5Movies[indexPath.row])
    }
}
