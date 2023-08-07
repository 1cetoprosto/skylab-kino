//
//  WatchListContainer.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 11.07.2023.
//

import Foundation
import Swinject

extension Container {
    
    static let watchListViewModel = {
        
        let container = Container()
        
        container.register(MovieListViewModelType.self) { _ in
            MovieListViewModel()
        }
        
        return container
    }()
    
}
