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
}

extension ApiEndpoints {
    
    var baseURL: URL {
        URL(string: "https://sandbox.cardpay.com/demo-merchant")!
    }
    
    var path: String {
        switch self {
        case .mobileToken:
            return "/mobile/generate_token"
        }
    }
            
    var method: Moya.Method {
        .post
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
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .mobileToken:
            return [
                "Content-Type": "application/json",
            ]
        }
    }
}
