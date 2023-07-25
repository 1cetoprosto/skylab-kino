//
//  UILabel+Extension.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 20.07.2023.
//

import UIKit

extension UILabel {
    
    func configureCustomLabel(font: Montserrat, textColor: UIColor, _ lineSpacing: CGFloat?) {
        
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        // Create a paragraph style
        let paragraphStyle = NSMutableParagraphStyle()
        // Set the line spacing (line height)
        paragraphStyle.lineSpacing = lineSpacing ?? 1.2
        // Apply the paragraph style to the attributed string
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))

        // Set the attributed and configure text on the label
        self.font = font.font()
        self.textColor = textColor
        self.attributedText = attributedString
    }
}
