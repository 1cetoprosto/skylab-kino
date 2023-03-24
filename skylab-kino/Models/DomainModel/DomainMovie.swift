//
//  DomainMovie.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 03.03.2023.
//

import Foundation

struct DomainMovie {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let rank: Int
}

typealias DomainMovies = [DomainMovie]
