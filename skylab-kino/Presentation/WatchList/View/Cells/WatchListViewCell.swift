//
//  WatchListViewCell.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 23.05.2023.
//

import UIKit

class WatchListViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!

    var viewModel: WatchListItemViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            title.text = viewModel.title
        }
    }
}
