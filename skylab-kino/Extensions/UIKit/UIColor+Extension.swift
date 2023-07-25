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
        static var blue: UIColor { HEX.h0296E5 }
        static var gray: UIColor { HEX.h67686D }
        static var backgound: UIColor { HEX.h242A32 }
    }

    fileprivate struct HEX {
        // main colors
        static let hFFFFFF = UIColor(hex: 0xFFFFFF)
        static let h1E1E1E = UIColor(hex: 0x1E1E1E)
        static let h0296E5 = UIColor(hex: 0x0296E5)
        static let h67686D = UIColor(hex: 0x67686D)
        static let h242A32 = UIColor(hex: 0x242A32)
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
