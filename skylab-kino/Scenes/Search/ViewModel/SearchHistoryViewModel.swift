//
//  SearchHistoryViewModel.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 08.04.2023.
//

import Foundation

class SearchHistoryViewModel: SearchHistoryViewModelType {
    
    private var movies: [String]?
    
    var isEmpty: Bool {
        guard let movies else { return true }
        return movies.isEmpty
    }
    
    private var selectedIndexPath: IndexPath?
    
    func addSearchHistory(query: String) {
        // Додавання запиту в список попередніх пошукових запитів та обмеження їхньої кількості до 10.
        guard var movies else { return }
        
        if movies.contains(query) {
            movies.removeAll { $0 == query }
        }
        movies.insert(query, at: 0)
        if movies.count > 10 {
            movies.removeLast()
        }
    }
    
    func getSearchHistory() {
        movies = ["Avatar",
                  "Avatar 2",
                  "Avengers",
                  "Huesera: The Bone Woman",
                  "Rye Lane",
                  "Joyland",
                  "Full Time",
                  "Return to Seoul",
                  "A Thousand and One",
                  "Attachment",
                  "John Wick: Chapter 4",
                  "Titanik"]
    }
    
    func filter(searchText: String) {
        guard let movies else { return }
        self.movies = movies.filter { $0.localizedCaseInsensitiveContains(searchText) }
    }
    
    func removeAll() {
        self.movies = []
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
