//
//  SearchViewController.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.03.2023.
//

import UIKit

class SearchViewController: BaseViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var suggestionsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var emptySearchView: UIView!
    @IBOutlet weak var messageTitleLabel: UILabel!
    @IBOutlet weak var messageDescriptionLabel: UILabel!
    
    // MARK: - let/var
    var previousSearchesViewModel: SearchHistoryViewModelType?
    var searchResultViewModel: MovieListViewModelType?
    
    // MARK: - lifecycle func
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - UI Configuration funcs
    fileprivate func configureUI() {
        
        emptySearchView.isHidden = !(searchResultViewModel?.isEmpty ?? true)
        
        if !emptySearchView.isHidden {
            suggestionsTableView.isHidden = true
            emptySearchView.backgroundColor = .clear
            
            messageTitleLabel.configureCustomLabel(font: .semiBold(size: 16), textColor: .white, nil)
            messageTitleLabel.text = "We Are sorry, we can not find the movie :("
            
            messageDescriptionLabel.configureCustomLabel(font: .medium(size: 12), textColor: UIColor.Main.gray, nil)
            messageDescriptionLabel.text = "Find your movie by Type title, categories, years, etc"
        }
        
        searchBar.delegate = self
        searchBar.placeholder = "Пошук фільмів"
        definesPresentationContext = true
        
        suggestionsTableView.delegate = self
        suggestionsTableView.dataSource = self
        
        let movieNib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        suggestionsTableView.register(movieNib, forCellReuseIdentifier: "MovieTableViewCell")
        
    }
    
    // MARK: - Private Methods
    private func executeSearch(query: String) {
        previousSearchesViewModel?.removeAll()
        searchResultViewModel?.getSearchResultList(query: query)
        
        guard let searchResultViewModel else { return }
        if searchResultViewModel.isEmpty {
            showEmptyResultsMessage()
        } else {
            suggestionsTableView.reloadData()
        }
        
        saveSearchQuery(query: query)
    }
    
    private func saveSearchQuery(query: String) {
        previousSearchesViewModel?.addSearchHistory(query: query)
    }
    
    private func filterPreviousSearches(with searchText: String) {
        suggestionsTableView.isHidden = false
        // Фільтрація попередніх пошукових запитів за введеним текстом
        if searchText.isEmpty {
            suggestionsTableView.reloadData()
        } else {
            previousSearchesViewModel?.getSearchHistory()
            previousSearchesViewModel?.filter(searchText: searchText)
            suggestionsTableView.reloadData()
        }
    }
    
    private func showMovieDetails(movie: MovieItemViewModelType) {
        // Відкриття екрану "Details screen" з інформацією про фільм (використайте ваш Coordinator для переходів між екранами)
        // Наприклад:
        //coordinator.showMovieDetails(movie: movie)
    }
    
    private func showEmptyResultsMessage() {
        suggestionsTableView.isHidden = true
        emptySearchView.isHidden = false
    }
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let searchResultViewModel, let  previousSearchesViewModel else { return 0 }
        
        if searchResultViewModel.isEmpty && previousSearchesViewModel.isEmpty {
            return 0
        }
        
        if searchResultViewModel.isEmpty && !previousSearchesViewModel.isEmpty {
            return previousSearchesViewModel.numberOfRowInSection(for: section)
        }
        
        return searchResultViewModel.numberOfRowInSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let searchResultViewModel, let  previousSearchesViewModel else { return UITableViewCell()}
        
        if searchResultViewModel.isEmpty && !previousSearchesViewModel.isEmpty {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousSearchesViewCell", for: indexPath) as? PreviousSearchesViewCell else { return UITableViewCell()}
            cell.viewModel = previousSearchesViewModel.cellViewModel(for: indexPath)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell()}
        let cellViewModel = searchResultViewModel.cellViewModel(for: indexPath)
        cell.selectionStyle = .default
        cell.viewModel = cellViewModel
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let searchResultViewModel, let  previousSearchesViewModel else { return }
        // Обробка натискання на попередній пошук або результат пошуку
        if searchResultViewModel.isEmpty && !previousSearchesViewModel.isEmpty {
            let previousSearch = previousSearchesViewModel.titleForCell(atIndexPath: indexPath)
            searchBar.text = previousSearch
            executeSearch(query: previousSearch)
        } else if !searchResultViewModel.isEmpty {
            guard let selectedMovie = searchResultViewModel.cellViewModel(for: indexPath) else { return }
            showMovieDetails(movie: selectedMovie)
        }
    }
    
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Виконання пошукового запиту при натисканні на "Search" на клавіатурі
        if let query = searchBar.text, !query.isEmpty {
            executeSearch(query: query)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Фільтрація попередніх пошукових запитів при зміні тексту в полі пошуку
        filterPreviousSearches(with: searchText)
    }
}
