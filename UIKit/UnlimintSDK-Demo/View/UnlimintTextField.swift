//
//  UnlimintTextField.swift
//  UnlimintSDK-Demo
//
//  Created by Denis Gnezdilov on 23.03.2021.
//

import UIKit

class UnlimintTextField: UIView {

    // MARK: UI views
    private let stackView: UIStackView = .init()
    private let titleLabel: UILabel = .init()
    private let textField: InsetTextField = .init()

    // MARK: Internal properties
    var title: String? {
        set {
            titleLabel.text = newValue
        }
        get {
            titleLabel.text
        }
    }
    var placeholder: String? {
        set {
            textField.placeholder = newValue
        }
        get {
            textField.placeholder
        }
    }
    var value: String? {
        set {
            textField.text = newValue
        }
        get {
            textField.text
        }
    }
    var delegate: UITextFieldDelegate?

    // MARK: Private properties

    // MARK: Init & Override
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func becomeFirstResponder() -> Bool {
        return textField.becomeFirstResponder()
    }

    override func resignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }
}

// MARK: Utils
extension UnlimintTextField {
    func addNotification(to selector: Selector, name: NSNotification.Name, object: Any) {
        NotificationCenter
            .default
            .addObserver(object,
                         selector: selector,
                         name: name,
                         object: textField)
    }
}


private extension UnlimintTextField {
    func setup() {
        setupStackView()
        setupTitleField()
        setupTextField()
    }

    func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func setupTitleField() {
        stackView.addArrangedSubview(titleLabel)

        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
    }

    func setupTextField() {
        stackView.addArrangedSubview(textField)

        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        textField.font = .systemFont(ofSize: 16)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        textField.layer.borderColor = UIColor.lightGray.cgColor

        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

extension UnlimintTextField: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

        return delegate?.textFieldShouldBeginEditing?(textField) ?? true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor

        delegate?.textFieldDidBeginEditing?(textField)
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {

        return delegate?.textFieldShouldEndEditing?(textField) ?? true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor

        delegate?.textFieldDidEndEditing?(textField)
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {

        delegate?.textFieldDidEndEditing?(textField, reason: reason)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        return delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {

        delegate?.textFieldDidChangeSelection?(textField)
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {

        return delegate?.textFieldShouldClear?(textField) ?? true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        return delegate?.textFieldShouldReturn?(textField) ?? true
    }
}
