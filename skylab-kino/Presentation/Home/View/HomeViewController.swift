//
//  HomeViewController.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 23.02.2023.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var top5CollectionView: UICollectionView!
    @IBOutlet weak var requestSegmented: CustomSegmentedControl! {
        didSet {
            requestSegmented.setButtonTitles(buttonTitles: ["Now playing", "Upcoming", "Top rated", "Popular"])
            requestSegmented.selectorViewColor = UIColor.Main.gray
            requestSegmented.selectorTextColor = UIColor.Main.white
        }
    }
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    private var top5MoviesViewModel: Top5MoviesViewModelType?
    private var moviesViewModel: MoviesViewModelType?
    private var isLoading = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        top5MoviesViewModel = Top5MoviesViewModel()
        top5MoviesViewModel?.getTop5Movies { [weak self] in
            self?.top5CollectionView.reloadData()
        }
        
        moviesViewModel = MoviesViewModel()
        moviesViewModel?.getMovies { [weak self] in
            self?.movieCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        top5CollectionView.dataSource = self
        top5CollectionView.delegate = self
        
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        
    }
}

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

// extension HomeViewController: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView == top5CollectionView {
//            top5CollectionView.didSelectItemAt(indexPath: indexPath, in: collectionView)
//        } else {
//            movieCollectionView.didSelectItemAt(indexPath: indexPath, in: collectionView)
//        }
//    }
//
// }

// extension HomeViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: 144, height: 250)
//    }
// }
