//
//  MoviesViewModelType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.03.2023.
//

import Foundation

protocol MoviesViewModelType {
    func getMovies(completion: @escaping() -> Void)
    
    func numberOfItemsInSection(for section: Int) -> Int
    func cellViewModel(for indexPath: IndexPath) -> MovieItemViewModelType?
    
}
