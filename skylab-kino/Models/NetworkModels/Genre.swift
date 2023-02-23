//
//  Genre.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 23.02.2023.
//

import Foundation

// MARK: - Genre
struct Genre: Codable {
    let genres: [GenreElement]
}

// MARK: - GenreElement
struct GenreElement: Codable {
    let id: Int
    let name: String
}
