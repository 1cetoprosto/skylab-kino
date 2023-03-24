//
//  Top5CollectionView.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 19.03.2023.
//

import UIKit

class Top5CollectionView: UICollectionView {

    private var viewModel: Top5MoviesViewModelType?
    private var isLoading = false
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .green
        
        delegate = self
        dataSource = self
        
        register(Top5MovieCollectionViewCell.self, forCellWithReuseIdentifier: Top5MovieCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        viewModel = Top5MoviesViewModel()
        viewModel?.getTop5Movies { [weak self] in
            self?.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        // Configure the layout of the collection view
//                let layout = UICollectionViewFlowLayout()
//                layout.itemSize = CGSize(width: 50, height: 50)
//                layout.scrollDirection = .vertical
//                collectionView.collectionViewLayout = layout
//
//                // Set the background color of the collection view
//                collectionView.backgroundColor = UIColor.white
    }
    
}

extension Top5CollectionView: UICollectionViewDelegate {
    
}

extension Top5CollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItemsInSection(for: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: Top5MovieCollectionViewCell.reuseId, for: indexPath) as! Top5MovieCollectionViewCell
        
        
        return cell
    }
    
}

extension Top5CollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 144, height: 250)
    }
}
