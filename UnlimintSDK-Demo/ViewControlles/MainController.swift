//
//  MainController.swift
//  UnlimintSDK-Demo
//
//  Created by Denis Gnezdilov on 01.12.2020.
//

import UIKit
import UnlimintSDK_UI

class MainController: UIViewController {

    // MARK: UI views
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var paymentButton: UIButton!
    @IBOutlet private var linkButton: UIButton!


    // MARK: Internal properties

    // MARK: Private properties
    private let authorizationProvider: AuthorizationProvider = .init()

    // MARK: Init & Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Unlimint.shared.environment = .sandbox

        setup()
    }

    // MARK: Actions
    @IBAction func onPayment(_ sender: Any) {
        authorizationProvider.setup { mobileToken in
            DispatchQueue.main.async {
                Unlimint
                    .shared
                    .payment(for: mobileToken, with: [
                        .card(.init(with: "<Merchant>",
                                    paymentMethod: "BANKCARD",
                                    customer: .init(homePhone: nil,
                                                    workPhone: nil,
                                                    email: "test@unlimint.com",
                                                    locale: nil),
                                    merchantOrder: .init(description: "<description>", id: "<id>"),
                                    paymentData: .init(amount: 5,
                                                       currency: "EUR",
                                                       note: nil,
                                                       dynamicDescriptor: nil,
                                                       transType: nil),
                                    cardAccount: nil)),
                        .cardToken(type: .mastercard, .init(with: "<Merchant>",
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
                                                    cardAccount: .init(token: "a3d85ac0-4268-bb12-a628-f1e13a4988d8",
                                                                       pan: "1234",
                                                                       billingAddress: nil))),
                        .cardToken(type: .mir, .init(with: "<Merchant>",
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
                                                    cardAccount: .init(token: "a3d85ac0-4268-bb12-a628-f1e13a4988d8",
                                                                       pan: "1234",
                                                                       billingAddress: nil))),
                        .payPal(.init(merchantName: "<Merchant>",
                                      merchantOrder: .init(description: "<description>",
                                                           id: "<id>"),
                                      paymentMethod: "PAYPAL",
                                      paymentData: .init(amount: 5,
                                                         currency: "EUR",
                                                         note: nil,
                                                         dynamicDescriptor: nil,
                                                         transType: nil),
                                      customer: .init(email: "test@unlimint.com")))
                    ])
            }
        }
    }


    @IBAction func onBind(_ sender: Any) {
        authorizationProvider.setup { mobileToken in
            DispatchQueue.main.async {
                Unlimint
                    .shared
                    .bind(for: mobileToken,
                          with: .init(currency: .init(with: "EUR"),
                                      customer: .init(id: "test",
                                                      email: "customer@mail.com")))
            }
        }
    }
}

private extension MainController {
    func setup() {

        setupBottomButtons()
    }

    func setupBottomButtons() {
        paymentButton.setup(style: .main)
        linkButton.setup(style: .link)
    }
}
