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
struct CardToken: Codable {
    let card: Card
}

// MARK: - Card
struct Card: Codable {
    let acctType : String?
    let cardBrand, cardType, expiration: String
    let holder, issuer, issuingCountryCode, maskedPan: String
    let token: String
    let filingID: JSONNull?

    enum CodingKeys: String, CodingKey {
        case acctType = "acct_type"
        case cardBrand = "card_brand"
        case cardType = "card_type"
        case expiration, holder, issuer
        case issuingCountryCode = "issuing_country_code"
        case maskedPan = "masked_pan"
        case token
        case filingID = "filing_id"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
