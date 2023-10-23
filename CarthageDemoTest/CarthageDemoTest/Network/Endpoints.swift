//
//  Endpoints.swift
//  UnlimintSDK-Demo
//
//  Created by Denis Gnezdilov on 01.12.2020.
//

import Foundation
import Moya
import UnlimintSDK_SwiftUI
import UnlimintSDK_Core

enum ApiEndpoints: TargetType {
    case mobileToken
    case cardToken(String)
}

extension ApiEndpoints {
    
    var baseURL: URL {
        URL(string: "https://sandbox.cardpay.com/demo-merchant")!
    }
    
    var path: String {
        switch self {
        case .mobileToken:
            return "/mobile/generate_token"
        case .cardToken(let transationid):
            return "/mobile/payment/\(transationid)"
        }
    }

    var method: Moya.Method {
        
        switch self {
        case .mobileToken:
            return .post
        case .cardToken:
            return .get
        }
    }

    var sampleData: Data { Data() }
    
    var task: Task {
        switch self {            
        case .mobileToken:
            return .requestParameters(parameters: [
                "request": [
                    "id": UUID().uuidString,
                    "time": {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z"
                        formatter.timeZone = TimeZone(secondsFromGMT: 0)
                        
                        return formatter.string(from: Date())
                    }()
                ]
            ],
            encoding: JSONEncoding.default)
        case .cardToken:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
        ]
    }
}
