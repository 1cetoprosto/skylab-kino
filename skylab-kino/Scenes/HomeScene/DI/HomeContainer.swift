//
//  HomeContainer.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 10.07.2023.
//

import Foundation
import Swinject

extension Container {
    
    static let top5Movies = {
        
        let container = Container()
        
        container.register(Top5MoviesViewModelType.self) { _ in
            Top5MoviesViewModel()
        }
        
        return container
    }()
    
    static let movies = {
        
        let container = Container()
        
        container.register(MoviesViewModelType.self) { _ in
            MoviesViewModel()
        }
        
        return container
    }()
}
