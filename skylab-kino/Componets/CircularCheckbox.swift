//
//  CircularCheckbox.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 17.02.2023.
//

import UIKit

final class CircularCheckbox: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.secondaryLabel.cgColor
        layer.cornerRadius = frame.size.width / 2.0
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
