//
//  Top5MoviesViewModelType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 19.03.2023.
//

import Foundation

protocol Top5MoviesViewModelType {
    func getTop5Movies(completion: @escaping() -> Void)
    func numberOfItemsInSection(for section: Int) -> Int
    func cellViewModel(for indexPath: IndexPath) -> MovieItemViewModelType?
}
