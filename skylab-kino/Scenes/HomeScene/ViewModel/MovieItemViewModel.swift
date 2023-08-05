//
//  MovieItemViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 25.02.2023.
//

import Foundation

class MovieItemViewModel: MovieItemViewModelType {
    
    private var movie: DomainMovie
    
    init(movie: DomainMovie) {
        self.movie = movie
    }
    
    var title: String {
        return movie.title
    }
    
    var posterPath: String {
        return movie.posterPath
    }
    
    var rank: Int {
        return movie.rank
    }
    var genre: String {
        return movie.genreIDS[0].description
    }
    
    var year: String {
        return movie.releaseDate
    }
    
    var duration: Int {
        return movie.rank
    }
    
}
