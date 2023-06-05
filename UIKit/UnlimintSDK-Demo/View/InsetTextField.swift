//
//  InsetTextField.swift
//  UnlimintSDK-Demo
//
//  Created by Denis Gnezdilov on 23.03.2021.
//

import UIKit

class InsetTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: .init(top: 0, left: 8, bottom: 0, right: 8))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: .init(top: 0, left: 8, bottom: 0, right: 8))
    }
}
