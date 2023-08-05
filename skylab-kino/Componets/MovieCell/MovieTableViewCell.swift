//
//  MovieTableViewCell.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 23.05.2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    var viewModel: MovieItemViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }

            //contentView.backgroundColor = UIColor.Main.backgound
            if let posterImage = UIImage(named: viewModel.posterPath) {
                posterImageView.image = posterImage
            }
            posterImageView.layer.cornerRadius = 16
            selectionStyle = .none
            
            titleLabel.text = viewModel.title
            titleLabel.configureCustomLabel(font: .regular(size: 16), textColor: UIColor.Main.white, nil)
            
            ratingLabel.text = String(viewModel.rank)
            ratingLabel.configureCustomLabel(font: .regular(size: 12), textColor: UIColor.Main.secondaryOrange, nil)
            
            genreLabel.text = viewModel.genre
            genreLabel.configureCustomLabel(font: .regular(size: 12), textColor: UIColor.Main.white, nil)
            
            yearLabel.text = viewModel.year
            yearLabel.configureCustomLabel(font: .regular(size: 12), textColor: UIColor.Main.white, nil)
            
            durationLabel.text = String(viewModel.duration)
            durationLabel.configureCustomLabel(font: .regular(size: 12), textColor: UIColor.Main.white, nil)
        }
    }
}
