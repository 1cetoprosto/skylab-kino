//
//  WatchListItemViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 23.05.2023.
//

import Foundation

class WatchListItemViewModel: WatchListItemViewModelType {
    
    private let item: DomainMovie
    
    init(item: DomainMovie) {
        self.item = item
    }
    
    var title: String {
        return item.title
    }
    
}
