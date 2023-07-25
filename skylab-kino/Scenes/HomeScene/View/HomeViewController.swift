//
//  HomeViewController.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 23.02.2023.
//

import UIKit

class HomeViewController: BaseViewController, Storyboarded, UICollectionViewDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var top5CollectionView: UICollectionView!
    @IBOutlet weak var requestSegmented: CustomSegmentedControl! 
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    // MARK: - let/var
    var top5MoviesViewModel: Top5MoviesViewModelType?
    var moviesViewModel: MoviesViewModelType?
    private var isLoading = false
    
    // MARK: - lifecycle func
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        top5CollectionView.dataSource = self
        top5CollectionView.delegate = self
        
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        
        configureUI()
        
        top5MoviesViewModel?.getTop5Movies()
        moviesViewModel?.getMovies()
    }
    
    // MARK: - UI Configuration funcs
    private func configureUI() {
        
        requestSegmented.setButtonTitles(buttonTitles: ["Now playing", "Upcoming", "Top rated", "Popular"])
        requestSegmented.selectorViewColor = UIColor.Main.gray
        requestSegmented.selectorTextColor = UIColor.Main.white
        requestSegmented.selectorFont = Montserrat.medium(size: 14).font()
    }
}

// MARK: - Extensions
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == top5CollectionView {
            guard let top5MoviesViewModel else { return 0 }
            
            return top5MoviesViewModel.numberOfItemsInSection(for: section)
        } else {
            guard let moviesViewModel else { return 0 }
            
            return moviesViewModel.numberOfItemsInSection(for: section)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == top5CollectionView {
            let cell = top5CollectionView.dequeueReusableCell(withReuseIdentifier: Top5MovieCollectionViewCell.reuseId, for: indexPath) as? Top5MovieCollectionViewCell
            
            guard let cell, let top5MoviesViewModel else { return UICollectionViewCell() }
            
            cell.viewModel = top5MoviesViewModel.cellViewModel(for: indexPath)
            
            return cell
        } else {
            let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseId, for: indexPath) as? MovieCollectionViewCell
            
            guard let cell, let moviesViewModel else { return UICollectionViewCell() }
            
            cell.viewModel = moviesViewModel.cellViewModel(for: indexPath)
            
            return cell
        }
    }
}
