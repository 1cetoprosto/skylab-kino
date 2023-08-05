//
//  MovieItemViewModelType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 25.02.2023.
//

import Foundation

protocol MovieItemViewModelType: AnyObject {
    var posterPath: String { get }
    var title: String { get }
    var rank: Int { get }
    var genre: String { get }
    var year: String { get }
    var duration: Int { get }
}
