//
//  GenresItemViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.02.2023.
//

import Foundation

class GenresItemViewModel: GenresItemViewModelType {
    
    private var movies: DomainMovies
    
    var genreName: String
    
    var moviesArray: [MovieItemViewModel] {
        let moviesArray = movies.map { MovieItemViewModel(movie: $0)}
        return moviesArray
    }
    
    init(genreName: String, movies: DomainMovies) {
        self.movies = movies
        self.genreName = genreName
    }
}
