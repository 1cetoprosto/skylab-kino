//
//  MovieCollectionViewCell.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 24.03.2023.
//

import Foundation
import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "MovieCollectionViewCell"
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    var viewModel: MovieItemViewModelType? {
        willSet(viewModel) {
            guard let viewModel else { return }
            
            if let posterImage = UIImage(named: viewModel.posterPath) {
                movieImageView.image = posterImage
            }
            movieImageView.layer.cornerRadius = 16
            
        }
    }
    
}
