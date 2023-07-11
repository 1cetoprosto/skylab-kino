//
//  MovieItemViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 25.02.2023.
//

import Foundation

class MovieItemViewModel: MovieItemViewModelType {
    private var movie: DomainMovie
    
    var title: String {
        return movie.title
    }
    
    var posterPath: String {
        return movie.posterPath
    }
    
    var rank: Int {
        return movie.rank
    }
    
    init(movie: DomainMovie) {
        self.movie = movie
    }
}
