//
//  GenresViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.02.2023.
//

import Foundation

class GenresViewModel: GenresViewModelType {
    private var selectedIndexPath: IndexPath?
    private var genres: [(genre: String, items: DomainMovies)]?
    
    func getGenres(completion: @escaping () -> ()) {
        genres = []
//        genres?.append((genre: "Fantastik", items: [DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                    DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                    DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                    DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                    DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                    DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100)]))
//        genres?.append((genre: "Triller", items: [DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                  DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                  DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                  DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                  DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                  DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100)]))
//        genres?.append((genre: "Melodrame", items: [DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                    DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                    DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                    DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                    DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100),
//                                                    DomainMovie(adult: false, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "Titanik", originalTitle: "Titanik", overview: "Texxt of overview", popularity: 5, posterPath: "poster1", releaseDate: "01.01.2023", title: "Тітанік", video: true, voteAverage: 10, voteCount: 100)]))
        //genres = RealmManager.shared.fetchMoviesByGenres()
        //let genres = NetworkService.fetchGenres(completion)
        //        var tmdbGenres: [String] = {
        //            let genres = NetworkService.fetchGenres(com)
        //        }()
        completion()
    }
    
    //    func numberOfSections() -> Int {
    //        return sectionsGenres?.count ?? 0
    //    }
    
    func numberOfRowInSection(for section: Int) -> Int {
        return genres?.count ?? 0
    }
    
    //    func titleForHeaderInSection(for section: Int) -> String {
    //        guard let sectionsGenres = self.sectionsGenres else { return "" }
    //
    //        return sectionsGenres[section].genre
    //    }
    
    func cellViewModel(for indexPath: IndexPath) -> GenresItemViewModelType? {
        guard let genres = self.genres else { return nil }
        let movies = genres[indexPath.row].items
        let genre = genres[indexPath.row].genre
        
        return GenresItemViewModel(genreName: genre, movies: movies)
    }
    
    func viewModelForSelectedRow() -> MovieDetailsViewModelType? {
        return nil
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    
}
