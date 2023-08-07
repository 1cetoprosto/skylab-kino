//
//  SearchHistoryViewModelType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 08.04.2023.
//

import Foundation

protocol SearchHistoryViewModelType {
    var isEmpty: Bool { get }
    
    func addSearchHistory(query: String)
    func getSearchHistory()
    func filter(searchText: String)
    func removeAll()
    func numberOfRowInSection(for section: Int) -> Int
    func titleForCell(atIndexPath indexPath: IndexPath) -> String
    func cellViewModel(for indexPath: IndexPath) -> SearchHistoryItemViewModelType?
    func viewModelForSelectedRow() -> SearchHistoryItemViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
