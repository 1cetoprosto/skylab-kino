//
//  WatchListViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.04.2023.
//

import Foundation

class WatchListViewModel: WatchListViewModelType {
    
    private var selectedIndexPath: IndexPath?
    
    private var movies: DomainMovies?
    
    func getWatchList(completion: @escaping () -> Void) {
        movies = []
        movies?.append(DomainMovie(adult: false,
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
                                   rank: 0))
    }
    
    func numberOfRowInSection(for section: Int) -> Int {
        
        return movies?.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> WatchListItemViewModelType? {
        guard let movies else { return nil }
        let movie = movies[indexPath.row]

        return WatchListItemViewModel(item: movie)
    }
    
    func viewModelForSelectedRow() -> WatchListItemViewModelType? {
        guard let selectedIndexPath, let movies else { return nil }
        let movie = movies[selectedIndexPath.row]

        return WatchListItemViewModel(item: movie)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
}
