//
//  SearchContainer.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 11.07.2023.
//

import Foundation
import Swinject

extension Container {
    
    static let searchHistoryViewModel = {
        
        let container = Container()
        
        container.register(SearchHistoryViewModelType.self) { _ in
            SearchHistoryViewModel()
        }
        
        return container
    }()
    
}
