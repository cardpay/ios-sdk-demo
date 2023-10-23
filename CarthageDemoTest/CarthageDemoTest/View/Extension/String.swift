//
//  String.swift
//  SwiftUISDKTest
//
//  Created by Mohammad Parvez on 23/08/23.
//

import Foundation


extension String {
    var localized: String {
        
        NSLocalizedString(self,
                          bundle: Bundle.main,
                          comment: "")
    }
}
