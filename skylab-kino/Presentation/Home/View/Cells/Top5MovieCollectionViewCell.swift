//
//  Top5MovieCollectionViewCell.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 25.02.2023.
//

import Foundation
import UIKit

class Top5MovieCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "Top5MovieCollectionViewCell"
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var rankImageView: UIImageView!
    
    var viewModel: MovieItemViewModelType? {
        willSet(viewModel) {
            guard let viewModel else { return }
            
            if let posterImage = UIImage(named: viewModel.posterPath) {
                movieImageView.image = posterImage
            }
            movieImageView.layer.cornerRadius = 16
            
            if let rankImage = UIImage(named: viewModel.rank.description) {
                rankImageView.image = rankImage
            }
        }
    }
    
}

