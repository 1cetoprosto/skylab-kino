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
    @IBOutlet weak var requestSegmented: CustomSegmentedControl!{
        didSet{
            requestSegmented.setButtonTitles(buttonTitles: ["Now playing","Upcoming","Top rated","Popular"])
            requestSegmented.selectorViewColor = UIColor.Main.gray
            requestSegmented.selectorTextColor = UIColor.Main.white
        }
    }
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    private var viewModel: Top5MoviesViewModelType?
    private var isLoading = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel = Top5MoviesViewModel()
        viewModel?.getTop5Movies { [weak self] in
            self?.top5CollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(top5CollectionView)
//
//        top5CollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
//        top5CollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        top5CollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 24).isActive = true
//        top5CollectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
//        if let searchIcon = UIImage(named: "Home-selected") {
//            searchBar.setImage(searchIcon, for: .search, state: .normal)
//            searchBar.setImage(searchIcon, for: .search, state: .highlighted)
//            searchBar.setImage(searchIcon, for: .search, state: .disabled)
//        }
        
        //view.backgroundColor = UIColor.Main.black
        //tableView.backgroundColor = UIColor.Main.black
//        tableView.dataSource = self
//        tableView.delegate = self
        
        top5CollectionView.dataSource = self
        top5CollectionView.delegate = self
        
        //collectionView.collectionViewLayout = UICollectionViewFlowLayout()

    }
}

//extension HomeViewController: UITableViewDataSource {
//
////    func numberOfSections(in tableView: UITableView) -> Int {
////        return viewModel?.numberOfSections() ?? 0
////    }
////
////    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
////        return viewModel?.titleForHeaderInSection(for: section)
////    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel?.numberOfRowInSection(for: section) ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsTableViewCell", for: indexPath) as? FilmsTableViewCell
//        guard let tableViewCell = cell,
//        let viewModel = viewModel else { return UITableViewCell() }
//
//        let cellViewModel = viewModel.cellViewModel(for: indexPath)
//
//        tableViewCell.viewModel = cellViewModel
//
//        return tableViewCell
//    }
//
//    //func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        if indexPath.section == 0 {
////            return 44 // Item Cell height
////        } else {
////            return 55 // Loading Cell height
////        }
//        //return 270
//    //}
//}
//
//extension HomeViewController: UITableViewDelegate {
//    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//    }
//}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel else { return 0 }
        
        return viewModel.numberOfItemsInSection(for: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = top5CollectionView.dequeueReusableCell(withReuseIdentifier: Top5MovieCollectionViewCell.reuseId, for: indexPath) as? Top5MovieCollectionViewCell
        
        guard let cell, let viewModel else { return UICollectionViewCell() }
        
        cell.viewModel = viewModel.cellViewModel(for: indexPath)
        
        return cell
    }
    
}

//extension HomeViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: 144, height: 250)
//    }
//}
