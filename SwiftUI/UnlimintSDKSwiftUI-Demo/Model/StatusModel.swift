//
//  CardTokenModel.swift
//  SwiftUISDKTest
//
//  Created by Mohammad Parvez on 12/08/23.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct StatusModel: Codable {
    let uid: String
    let pan: String?
    let method: String
    let orderID: String?
    let amount: String?
}

