//
//  WatchListViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.04.2023.
//

import Foundation

class WatchListViewModel: WatchListViewModelType {
    var isEmpty: Bool {
        guard let movies else { return true }
        return movies.isEmpty
    }
    
    private var selectedIndexPath: IndexPath?
    
    private var movies: DomainMovies?
    
    func getWatchList() {
        movies = [DomainMovie(adult: false,
                              backdropPath: "",
                              genreIDS: [1],
                              id: 1,
                              originalLanguage: "Titanik",
                              originalTitle: "Titanik",
                              overview: "Texxt of overview",
                              popularity: 5,
                              posterPath: "poster1",
                              releaseDate: "01.01.2023",
                              title: "Тітанік",
                              video: true,
                              voteAverage: 10,
                              voteCount: 100,
                              rank: 0),
                  DomainMovie(adult: false,
                              backdropPath: "",
                              genreIDS: [1],
                              id: 1,
                              originalLanguage: "Titanik",
                              originalTitle: "Titanik",
                              overview: "Texxt of overview",
                              popularity: 5,
                              posterPath: "poster1",
                              releaseDate: "01.01.2023",
                              title: "Тітанік",
                              video: true,
                              voteAverage: 10,
                              voteCount: 100,
                              rank: 0),
                  DomainMovie(adult: false,
                              backdropPath: "",
                              genreIDS: [1],
                              id: 1,
                              originalLanguage: "Titanik",
                              originalTitle: "Titanik",
                              overview: "Texxt of overview",
                              popularity: 5,
                              posterPath: "poster1",
                              releaseDate: "01.01.2023",
                              title: "Тітанік",
                              video: true,
                              voteAverage: 10,
                              voteCount: 100,
                              rank: 0)]
    }
    
    func removeItem(at indexPath: IndexPath) {
            movies?.remove(at: indexPath.row)
    }
    
    func numberOfRowInSection(for section: Int) -> Int {
        
        return movies?.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> MovieItemViewModelType? {
        guard let movies else { return nil }
        let movie = movies[indexPath.row]

        return MovieItemViewModel(movie: movie)
    }
    
    func viewModelForSelectedRow() -> MovieItemViewModelType? {
        guard let selectedIndexPath, let movies else { return nil }
        let movie = movies[selectedIndexPath.row]

        return MovieItemViewModel(movie: movie)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
}
