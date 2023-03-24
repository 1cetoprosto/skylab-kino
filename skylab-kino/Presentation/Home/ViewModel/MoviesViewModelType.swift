//
//  MoviesViewModelType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.03.2023.
//

import Foundation

protocol MoviesViewModelType {
    func getMovies(completion: @escaping() -> ())
    
    //func numberOfSections() -> Int
    //func numberOfRowInSection(for section: Int) -> Int
    func numberOfItemsInSection(for section: Int) -> Int
    //func titleForHeaderInSection(for section: Int) -> String
    func cellViewModel(for indexPath: IndexPath) -> MovieItemViewModelType?

    //func viewModelForSelectedRow() -> MovieDetailsViewModelType?
    //func selectRow(atIndexPath indexPath: IndexPath)
    
}
