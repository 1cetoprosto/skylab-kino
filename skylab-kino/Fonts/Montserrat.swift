//
//  Montserrat.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 20.07.2023.
//

import UIKit

enum Montserrat {
    case medium(size: CGFloat)
    case regular(size: CGFloat)
    case semiBold(size: CGFloat)
    
    var name: String {
        switch self {
        case .medium:
            return "Montserrat-Medium"
        case .regular:
            return "Montserrat-Regular"
        case .semiBold:
            return "Montserrat-SemiBold"
        }
    }

    var size: CGFloat {
        switch self {
        case .medium(let size):
            return size
        case .regular(let size):
            return size
        case .semiBold(let size):
            return size
        }
    }
    
    func font() -> UIFont {
        guard let font = UIFont(name: self.name, size: self.size) else {
            return UIFont.systemFont(ofSize: self.size)
        }
        return font
    }
}
