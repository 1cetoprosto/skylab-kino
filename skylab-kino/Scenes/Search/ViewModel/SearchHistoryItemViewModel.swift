//
//  SearchHistoryItemViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 08.04.2023.
//

import Foundation

class SearchHistoryItemViewModel: SearchHistoryItemViewModelType {
    
    private let item: String
    
    init(item: String) {
        self.item = item
    }
    
    var title: String {
        return item
    }
    
}
