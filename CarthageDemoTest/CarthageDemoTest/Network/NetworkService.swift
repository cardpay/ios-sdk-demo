//
//  NetworkService.swift
//  UnlimintSDK
//
//  Created by Denis Gnezdilov on 02.10.2020.
//

import Foundation
import Moya
import Alamofire

class NetworkService {
    
    
    // MARK: Private properties
    private let network: MoyaProvider<ApiEndpoints> = .init(callbackQueue: .global(qos: .utility),
                                                            plugins: [])
    deinit {
        network.session.cancelAllRequests()
    }
    
    // MARK: Methods
}


extension NetworkService {
    
    func requestCardToken(_ transationid: String, onSuccess successCallback: ((_ cardToekn: CardToken) -> Void)?,
                          onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        network.request(.cardToken(transationid)) {  result in
            
            switch result {
                
            case let .success(response):
                let data = response.data
                
                let dataStr = String(decoding: data, as: UTF8.self)
                print(dataStr)
                guard let cardToken = try? JSONDecoder().decode(CardToken.self, from: data) else {
                    return
                }
                successCallback!(cardToken)

            case let .failure(error):
                assertionFailure(error.localizedDescription)
            }
        }
    }
}
