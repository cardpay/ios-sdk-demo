//
//  MainController.swift
//  UnlimintSDK-Demo
//
//  Created by Denis Gnezdilov on 01.12.2020.
//

import UIKit
import UnlimintSDK

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
        navigationController?.pushViewController(PaymentMethodsController(), animated: true)
    }


    @IBAction func onBind(_ sender: Any) {
        authorizationProvider.setup { mobileToken in
            DispatchQueue.main.async {
                Unlimint
                    .shared
                    .bindNewCardFor(for: mobileToken,
                                    with: .init(currency: .init(with: "EUR"),
                                                customer: .init(id: "test",
                                                                email: "customer@mail.com")),
                                    presentationStyle: .present(self))
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
