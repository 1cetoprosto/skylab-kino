//
//  TMDBGenresModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 23.02.2023.
//

import Foundation

// MARK: - Genre
struct TMDBGenresModel: Codable {
    let genres: [TMDBGenreModel]
}

// MARK: - GenreElement
struct TMDBGenreModel: Codable {
    let id: Int
    let name: String
}
