//
//  PaymentTokenController.swift
//  UnlimintSDK-Demo
//
//  Created by Denis Gnezdilov on 23.03.2021.
//

import UIKit
import UnlimintSDK_UI

class PaymentTokenController: UIViewController {
    // MARK: UI views
    private let textField: UnlimintTextField = .init()
    private let continueButton: UIButton = .init()

    // MARK: Internal properties

    // MARK: Private properties
    private let authorizationProvider: AuthorizationProvider = .init()

    // MARK: Init & Override
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: Actions
    @objc
    func onContinue() {
        guard let cardToken = textField.value else {
            assertionFailure()
            return
        }

        authorizationProvider.setup { mobileToken in
            DispatchQueue.main.async {
                Unlimint
                    .shared
                    .paymentWithToken(for: mobileToken,
                                      with: .init(with: "<Merchant>",
                                                  paymentMethod: "BANKCARD",
                                                  customer: .init(homePhone: nil,
                                                                  workPhone: nil,
                                                                  email: "test@unlimint.com",
                                                                  locale: "nil"),
                                                  merchantOrder: .init(description: "<description>",
                                                                       id: "<id>"),
                                                  paymentData: .init(amount: 5,
                                                                     currency: "EUR",
                                                                     note: nil,
                                                                     dynamicDescriptor: nil,
                                                                     transType: nil),
                                                  cardAccount: .init(token: cardToken,
                                                                     pan: "<pan>",
                                                                     billingAddress: nil)),
                                      presentationStyle: .present(self))
            }
        }
    }
}

private extension PaymentTokenController {
    func setup() {
        title = "Payment token"
        view.backgroundColor = .white

        setupTextField()
        setupContinueButton()
    }

    func setupTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.title = "Your token"
        textField.placeholder = "Enter a value"
        textField.addNotification(to: #selector(onTextFieldTextDidChange), name: UITextField.textDidChangeNotification, object: self)

        view.addSubview(textField)

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }

    func setupContinueButton() {
        view.addSubview(continueButton)

        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setup(style: .main)
        continueButton.addTarget(self, action: #selector(onContinue), for: .touchUpInside)
        continueButton.isEnabled = false

        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 32),
            continueButton.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

private extension PaymentTokenController {
    @objc
    func onTextFieldTextDidChange() {
        continueButton.isEnabled = (textField.value?.count ?? 0) > 0
    }
}
