//
//  WatchListViewController.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 08.04.2023.
//

import UIKit

class WatchListViewController: BaseViewController, Storyboarded {

    // MARK: - IBOutlets
    @IBOutlet weak var watchListTableView: UITableView!
    
    // MARK: - let/var
    var viewModel: WatchListViewModelType?
    
    // MARK: - lifecycle func
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureWatchListTableView()
        viewModel?.getWatchList()
    }
    
    // MARK: - UI Configuration funcs
    fileprivate func configureWatchListTableView() {
        
        watchListTableView.dataSource = self
        watchListTableView.delegate = self
        
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        watchListTableView.register(nib, forCellReuseIdentifier: "MovieTableViewCell")
        
    }
}

// MARK: - Extensions
extension WatchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRowInSection(for: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        
        guard let cell, let viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(for: indexPath)

        cell.viewModel = cellViewModel
        
        return cell
    }
    
}

extension WatchListViewController: UITableViewDelegate {
    
}
