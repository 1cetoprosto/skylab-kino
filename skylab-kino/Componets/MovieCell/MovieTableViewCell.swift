//
//  MovieTableViewCell.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 11.07.2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieLabel: UILabel!
    
    var viewModel: WatchListItemViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            movieLabel.text = viewModel.title
            movieLabel.configureCustomLabel(font: .regular(size: 16), textColor: UIColor.Main.white, nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
