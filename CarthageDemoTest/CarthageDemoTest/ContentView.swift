//
//  ContentView.swift
//  CarthageDemoTest
//
//  Created by Mohammad Parvez on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PaymentViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
