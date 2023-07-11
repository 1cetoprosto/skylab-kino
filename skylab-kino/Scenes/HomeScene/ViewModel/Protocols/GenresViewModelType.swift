//
//  GenresViewModelType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.02.2023.
//

import Foundation

protocol GenresViewModelType {
    func getGenres(completion: @escaping() -> Void)
    func numberOfRowInSection(for section: Int) -> Int
    func cellViewModel(for indexPath: IndexPath) -> GenresItemViewModelType?
    func viewModelForSelectedRow() -> MovieDetailsViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
