//
//  UIColor.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 20.11.2021.
//

import UIKit

extension UIColor {

    struct Main {
        static var white: UIColor { HEX.hFFFFFF }
        static var black: UIColor { HEX.h1E1E1E }
        static var gray: UIColor { HEX.h3A3F47 }
        static var blue: UIColor { HEX.h0296E5 }
    }

//    struct TabBar {
//        static var tint: UIColor { HEX.h50746C }
//    }
//
//    struct TableView {
//        static var cellBackground: UIColor { HEX.h1E1E1E }
//        static var cellLabel: UIColor { HEX.h000000 }
//    }

    fileprivate struct HEX {
        // main colors
        static let hFFFFFF = UIColor(hex: 0xFFFFFF)
        static let h1E1E1E = UIColor(hex: 0x1E1E1E)
        static let h3A3F47 = UIColor(hex: 0x3A3F47)
        static let h0296E5 = UIColor(hex: 0x0296E5)
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
