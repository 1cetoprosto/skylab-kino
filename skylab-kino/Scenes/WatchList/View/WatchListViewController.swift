//
//  WatchListViewController.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 08.04.2023.
//

import UIKit

class WatchListViewController: BaseViewController, Storyboarded {

    @IBOutlet weak var watchListTableView: UITableView!
    
    var watchListViewModel: WatchListViewModelType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        watchListViewModel = WatchListViewModel()
        watchListViewModel?.getWatchList { [weak self] in
            self?.watchListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        watchListTableView.dataSource = self
        watchListTableView.delegate = self
        
    }

}

extension WatchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        watchListViewModel?.numberOfRowInSection(for: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WatchListViewCell", for: indexPath) as? WatchListViewCell
        
        guard let cell, let watchListViewModel else { return UITableViewCell() }
        
        let cellViewModel = watchListViewModel.cellViewModel(for: indexPath)

        cell.viewModel = cellViewModel
        
        return cell
    }
    
}

extension WatchListViewController: UITableViewDelegate {
    
}
