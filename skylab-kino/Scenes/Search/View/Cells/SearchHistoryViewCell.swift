//
//  SearchHistoryViewCell.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 08.04.2023.
//

import UIKit

class SearchHistoryViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!

    weak var viewModel: SearchHistoryItemViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            title.text = viewModel.title
        }
    }
}
