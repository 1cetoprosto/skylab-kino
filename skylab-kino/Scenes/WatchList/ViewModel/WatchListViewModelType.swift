//
//  WatchListViewModelType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.04.2023.
//

import Foundation

protocol WatchListViewModelType {
    func getWatchList()
    func numberOfRowInSection(for section: Int) -> Int
    func cellViewModel(for indexPath: IndexPath) -> WatchListItemViewModelType?
    func viewModelForSelectedRow() -> WatchListItemViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
