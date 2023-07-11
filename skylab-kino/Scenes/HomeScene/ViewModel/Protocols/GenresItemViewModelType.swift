//
//  GenresItemViewModelType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.02.2023.
//

import Foundation

protocol GenresItemViewModelType: AnyObject {
    var genreName: String { get }
    var moviesArray: [MovieItemViewModel] { get }
}
