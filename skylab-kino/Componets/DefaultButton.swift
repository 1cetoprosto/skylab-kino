//
//  DefaultButton.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 01.12.2022.
//

import UIKit

class DefaultButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(UIColor.Main.white, for: .normal)
        backgroundColor      = UIColor.Main.green
        layer.cornerRadius   = 10
    }
}
