//
//  WatchListViewController.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 08.04.2023.
//
import Foundation
import UIKit

class WatchListViewController: BaseViewController, Storyboarded {

    // MARK: - IBOutlets
    @IBOutlet weak var watchListTableView: UITableView!
    @IBOutlet weak var emptyWishlistView: UIView!
    @IBOutlet weak var noMovieLabel: UILabel!
    @IBOutlet weak var findYourMovieLabel: UILabel!
    
    // MARK: - let/var
    var viewModel: WatchListViewModelType?
    
    // MARK: - lifecycle func
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.getWatchList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.getWatchList()
        configureUI()
        configureWatchListTableView()
        
    }
    
    // MARK: - UI Configuration funcs
    fileprivate func configureUI() {
        
        emptyWishlistView.isHidden = !(viewModel?.isEmpty ?? true)
        
        if !emptyWishlistView.isHidden {
            emptyWishlistView.backgroundColor = .clear
            
            noMovieLabel.configureCustomLabel(font: .semiBold(size: 16), textColor: .white, nil)
            noMovieLabel.text = "There is no movie yet!"
            
            findYourMovieLabel.configureCustomLabel(font: .medium(size: 12), textColor: UIColor.Main.gray, nil)
            findYourMovieLabel.text = "Find your movie by Type title, categories, years, etc"
        }
        
    }
    
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
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel?.removeItem(at: indexPath)
            tableView.reloadData()
            configureUI()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard
            //let goToLessonsLevel = viewModel?.openLessonsLevelController,
            let item = viewModel?.cellViewModel(for: indexPath)
        else { return }
        debugPrint(item)
        //goToLessonsLevel.onNext(item)
    }
}
