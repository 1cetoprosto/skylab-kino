//
//  SearchHistoryViewModelType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 08.04.2023.
//

import Foundation

protocol SearchHistoryViewModelType {
    func getSearchHistory(completion: @escaping() -> ())
    
    //func numberOfSections() -> Int
    func numberOfRowInSection(for section: Int) -> Int
    func titleForCell(atIndexPath indexPath: IndexPath) -> String
    //func titleForHeaderInSection(for section: Int) -> String
    func cellViewModel(for indexPath: IndexPath) -> SearchHistoryItemViewModelType?
    func viewModelForSelectedRow() -> SearchHistoryItemViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
