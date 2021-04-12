//
//  PaymentMethodsController.swift
//  UnlimintSDK-Demo
//
//  Created by Denis Gnezdilov on 22.03.2021.
//

import UIKit
import UnlimintSDK

class PaymentMethodsController: UIViewController {

    enum Items: String, CaseIterable {
        case payment = "Payment"
        case paymentToken = "Payment token"
    }

    // MARK: UI views
    private let tableView: UITableView = .init()

    // MARK: Internal properties

    // MARK: Private properties
    private let items: [Items] = Items.allCases
    private let authorizationProvider: AuthorizationProvider = .init()

    // MARK: Init & Override
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

private extension PaymentMethodsController {
    func setup() {
        title = nil
        view.backgroundColor = .white

        setupTableView()
    }

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Items.payment.rawValue)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Items.paymentToken.rawValue)

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension PaymentMethodsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.rawValue)!

        cell.textLabel?.text = item.rawValue
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        .init()
    }
}

extension PaymentMethodsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let item = items[indexPath.row]

        switch item {
        case .payment:
            authorizationProvider.setup { mobileToken in
                DispatchQueue.main.async {
                    Unlimint
                        .shared
                        .payment(for: mobileToken,
                                 with: .init(with: "<Merchant>",
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
                                             cardAccount: nil),
                                 presentationStyle: .present(self))
                }
            }

        case .paymentToken:
            navigationController?.pushViewController(PaymentTokenController(), animated: true)
        }
    }
}
