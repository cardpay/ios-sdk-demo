//
//  AuthorizationProvider.swift
//  UnlimintSDK-Demo
//
//  Created by Denis Gnezdilov on 01.12.2020.
//

import UIKit
import UnlimintSDK_SwiftUI
import Moya

class AuthorizationProvider {
    typealias StringClosure = (String) -> Void
    
    // MARK: Private properties
    private let network: MoyaProvider<ApiEndpoints> = .init(callbackQueue: .global(qos: .utility),
                                                            plugins: [])
    private var competionClosure: StringClosure?
    
    deinit {
        network.session.cancelAllRequests()
    }
    
    // MARK: Methods
    func setup(with completion: @escaping StringClosure) {
        competionClosure = completion
        
        requestMobileToken()
    }
}

private extension AuthorizationProvider {
    func requestMobileToken() {
        network.request(.mobileToken) { [unowned self] result in
            switch result {
            case let .success(response):
                let data = response.data
                let json = try? (JSONSerialization.jsonObject(with: data, options: []) as! [String: Any])

                guard let token = json?["token"] as? String else {
                    return
                }

                competionClosure?(token)

            case let .failure(error):
                assertionFailure(error.localizedDescription)
            }
        }
    }
}
