//
//  MovieItemViewModelType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 25.02.2023.
//

import Foundation

protocol MovieItemViewModelType: AnyObject {
    var posterPath: String { get }
    var rank: Int { get }
}
