//
//  ContentView.swift
//  UnlimintSDKSwiftUI-Demo
//
//  Created by Mohammad Parvez on 05/06/23.
//

import SwiftUI
import UnlimintSDK_SwiftUI
import UnlimintSDK_Core

enum SheetType {
    case payment
    case bind
}

struct ContentView: View {
    
    @State var showSheet = false
    private let authorizationProvider: AuthorizationProvider = .init()
    @State var token : String = ""
    @State private var showingSheet = false
    @State var sheetType : SheetType = .payment
    var testEditPayment = false
    
    let price: Decimal  = 6
    let currency : String = "EUR"

    init() {
        Unlimint.shared.environment = .sandbox
    }
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                
                Image("icon_boots")
                    .resizable()
                    .scaledToFit()
                
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Casual Sneakers")
                        .font(.title2)
                    
                    Text("Easy to get on and wear all day. Keeping you comfortable as you run. Lightweight and responsive, breathable, and secure.")
                        .font(.footnote)
                    
                    Text("")
                    
                    HStack {
                        Text("Price:")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        
                        Text((price.toPrice() ?? "0") + " \(currency)")
                            .font(.footnote)
                    }
                }
                .padding()
                
                Spacer()
                
                // Buy Button
                Button {
                    authorizationProvider.setup { newtoken in
                        showSheet = true
                        token = newtoken
                        sheetType = .payment
                    }
                    
                } label: {
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 5.0)
                            .frame(maxHeight: 50)
                            .accentColor(Color("AccentColor"))
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        
                        Text("Pay")
                            .foregroundColor(.blue)
                           // .background(Color.clear)
                            .accentColor(.black)
                    }
                }
                
                
                // Link a Card
                Button {
                    // LinkACard()
                    authorizationProvider.setup { newtoken in
                        showSheet = true
                        token = newtoken
                        sheetType = .bind
                    }
                    
                } label: {
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 5.0)
                            .frame(maxHeight: 50)
                            .foregroundColor(.clear)
                        Text("Link a card")
                            .underline()
                            .foregroundColor(.blue)
                            //.background(.clear)
                    }
                }
            }
        }
        
        .sheet(isPresented: $showSheet) {
            
            switch sheetType {
                
            case .payment :
               
                if testEditPayment {
                    
                    Unlimint.shared.checkout(for: token, with: [
                        
                        
                        .card(.init(with: "Facebook Inc",
                                    paymentMethod: "BANKCARD",
                                    customer: .init(homePhone: nil,
                                                    workPhone: nil,
                                                    email: "test@unlimint.com",
                                                    locale: nil),
                                    merchantOrder: .init(description: "<description>", id: "<id>"),
                                    paymentData: .init(amount: price,
                                                       currency: "EUR",
                                                       note: nil,
                                                       dynamicDescriptor: nil,
                                                       transType: nil),
                                    cardAccount: nil))
                    ])
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Unlimint SDK")
                }
                
                else {
                    
                    Unlimint.shared.checkout(for: token, with: [
                        
                        .card(.init(with: "Facebook Inc",
                                    paymentMethod: "BANKCARD",
                                    customer: .init(homePhone: nil,
                                                    workPhone: nil,
                                                    email: "test@unlimint.com",
                                                    locale: nil),
                                    merchantOrder: .init(description: "<description>", id: "<id>"),
                                    paymentData: .init(amount: price,
                                                       currency: "EUR",
                                                       note: nil,
                                                       dynamicDescriptor: nil,
                                                       transType: nil,
                                                       isEditable: true),
                                    cardAccount: nil)),
                        
                            .cardToken(type: .mastercard, .init(with: "<Merchant>",
                                                                paymentMethod: "BANKCARD",
                                                                customer: .init(homePhone: nil,
                                                                                workPhone: nil,
                                                                                email: "test@unlimint.com",
                                                                                locale: "nil"),
                                                                merchantOrder: .init(description: "<description>",
                                                                                     id: "<id>"),
                                                                paymentData: .init(amount: price,
                                                                                   currency: "EUR",
                                                                                   note: nil,
                                                                                   dynamicDescriptor: nil,
                                                                                   transType: nil),
                                                                cardAccount: .init(token: "a3d85ac0-4268-bb12-a628-f1e13a4988d8",
                                                                                   pan: "1234",
                                                                                   billingAddress: nil))),
                        
                            .cardToken(type: .mir, .init(with: "<Merchant>",
                                                         paymentMethod: "BANKCARD",
                                                         customer: .init(homePhone: nil,
                                                                         workPhone: nil,
                                                                         email: "test@unlimint.com",
                                                                         locale: "nil"),
                                                         merchantOrder: .init(description: "<description>",
                                                                              id: "<id>"),
                                                         paymentData: .init(amount: price,
                                                                            currency: "EUR",
                                                                            note: nil,
                                                                            dynamicDescriptor: nil,
                                                                            transType: nil),
                                                         cardAccount: .init(token: "a3d85ac0-4268-bb12-a628-f1e13a4988d8",
                                                                            pan: "1234",
                                                                            billingAddress: nil))),
                        
                            .payPal(.init(merchantName: "<Merchant>",
                                          merchantOrder: .init(description: "<description>",
                                                               id: "<id>"),
                                          paymentMethod: "PAYPAL",
                                          paymentData: .init(amount: price,
                                                             currency: "EUR",
                                                             note: nil,
                                                             dynamicDescriptor: nil,
                                                             transType: nil),
                                          customer: .init(email: "test@unlimint.com")))
                    ])
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Unlimint SDK")
                    //.presentationDetents([.height(450)])
            }
            case .bind :
                
                Unlimint.shared.bind(for: token, with:BindingMethodData(currency: .init(with: "EUR"), customer: .init(id: "test", email:"test@unlimint.com")))
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Unlimint SDK")
                //.presentationDetents([.height(450)])
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Decimal {
    func toPrice() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter.string(for: self)
    }
}
