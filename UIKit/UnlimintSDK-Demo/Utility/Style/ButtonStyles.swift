//
//  ButtonStyles.swift
//  UnlimintSDK-Demo
//
//  Created by Denis Gnezdilov on 22.03.2021.
//

import UIKit

enum ButtonStyles {
    case main
    case link
}

extension UIButton {
    func setup(style: ButtonStyles) {
        switch style {
        case .main:
            setupMainStyle()

        case .link:
            setupLinkStyle()
        }
    }

    private func setupMainStyle() {
        // Corner radius
        layer.cornerRadius = 4

        // Titles
        setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        setTitleColor(UIColor(red: 0.749, green: 0.749, blue: 0.749, alpha: 1), for: .disabled)

        // Background
        do {
            let color = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
            setBackgroundColor(color: color, forState:.disabled)
        }

        do {
            let color = UIColor(red: 0.788, green: 0.969, blue: 0.227, alpha: 1)
            setBackgroundColor(color: color, forState: .normal)
            setBackgroundColor(color: color, forState: .selected)
            setBackgroundColor(color: color, forState: .highlighted)
        }
    }

    private func setupLinkStyle() {
        setTitleColor(UIColor(red: 0.204, green: 0.42, blue: 0.843, alpha: 1), for: .normal)
        titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
    }
}

private extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}
