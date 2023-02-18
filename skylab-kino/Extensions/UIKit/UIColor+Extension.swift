//
//  UIColor.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 20.11.2021.
//

import UIKit

extension UIColor {

    struct Main {
        static var black: UIColor { HEX.hFFFFFF }
        static var milk: UIColor { HEX.hEDDDC4 }
        static var green: UIColor { HEX.h50746C }
        static var yellow: UIColor { HEX.hE7B34D }
        static var white: UIColor { HEX.hFFFFFF }
    }

    struct TabBar {
        static var tint: UIColor { HEX.h50746C }
    }

    struct TableView {
        static var cellBackground: UIColor { HEX.hFFFFFF }
        static var cellLabel: UIColor { HEX.h000000 }
    }

    fileprivate struct HEX {
        // main colors
        static let h000000 = UIColor(hex: 0x000000)
        static let hEDDDC4 = UIColor(hex: 0xEDDDC4)
        static let h50746C = UIColor(hex: 0x50746C)
        static let hE7B34D = UIColor(hex: 0xE7B34D)
        static let hFFFFFF = UIColor(hex: 0xFFFFFF)
    }

}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}
