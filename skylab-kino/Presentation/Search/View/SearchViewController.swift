//
//  SearchViewController.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.03.2023.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var suggestionsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var searchHistoryViewModel: SearchHistoryViewModelType?
    //private var searchResaultViewModel: SearchHistoryViewModelType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchHistoryViewModel = SearchHistoryViewModel()
        searchHistoryViewModel?.getSearchHistory { [weak self] in
            self?.suggestionsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        suggestionsTableView.delegate = self
        suggestionsTableView.dataSource = self
        
    }
    
//    func showSuggestionsTableView() {
//        if suggestionsTableView == nil {
//            // Get keyboard height dynamically and 60 is my navigationBar height.
//            let y = searchBar.frame.origin.y + searchBar.frame.size.height + 60
//            let height = view.frame.size.height - y - keyboardHeight
//            suggestionsTableView = UITableView(frame: CGRect(x: 0, y: y, width: view.frame.size.width, height: height))
//            suggestionsTableView?.delegate = self
//            suggestionsTableView?.dataSource = self
//            suggestionsTableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//            view.addSubview(suggestionsTableView!)
//        }
//    }
    
    
}

extension SearchViewController: UITableViewDelegate {

}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchHistoryViewModel?.numberOfRowInSection(for: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchHistoryViewCell", for: indexPath) as? SearchHistoryViewCell
        
        guard let cell, let searchHistoryViewModel else { return UITableViewCell() }
        
        let cellViewModel = searchHistoryViewModel.cellViewModel(for: indexPath)

        cell.viewModel = cellViewModel
        
        return cell
    }


}
