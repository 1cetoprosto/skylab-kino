//
//  SearchHistoryViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 08.04.2023.
//

import Foundation

class SearchHistoryViewModel: SearchHistoryViewModelType {
    
    private var selectedIndexPath: IndexPath?
    
    private var movies: [String]?
    
    func getSearchHistory(completion: @escaping () -> ()) {
        movies = []
        movies?.append("Avatar")
        movies?.append("Avatar 2")
        movies?.append("Avengers")
        movies?.append("Huesera: The Bone Woman")
        movies?.append("Rye Lane")
        movies?.append("Joyland")
        movies?.append("Full Time")
        movies?.append("Return to Seoul")
        movies?.append("A Thousand and One")
        movies?.append("Attachment")
        movies?.append("John Wick: Chapter 4")
        
        completion()
    }
    
    func numberOfRowInSection(for section: Int) -> Int {
        movies?.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> SearchHistoryItemViewModelType? {
        guard let movies else { return nil }
        let movie = movies[indexPath.row]
        
        return SearchHistoryItemViewModel(item: movie)
    }

    func viewModelForSelectedRow() -> SearchHistoryItemViewModelType? {
        guard let selectedIndexPath, let movies else { return nil }
        let movie = movies[selectedIndexPath.row]
        
        return SearchHistoryItemViewModel(item: movie)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func titleForCell(atIndexPath indexPath: IndexPath) -> String {
        guard let movies else { return "" }
        return movies[indexPath.row]
    }
    
}
