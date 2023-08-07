//
//  WatchListViewModelType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.04.2023.
//

import Foundation

protocol MovieListViewModelType {
    var isEmpty: Bool { get }
    
    func getWatchList()
    func getSearchResultList(query: String)
    func removeItem(at indexPath: IndexPath)
    func numberOfRowInSection(for section: Int) -> Int
    func cellViewModel(for indexPath: IndexPath) -> MovieItemViewModelType?
    func viewModelForSelectedRow() -> MovieItemViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
