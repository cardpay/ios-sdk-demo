//
//  ContentView.swift
//  SwiftUISDKTest
//
//  Created by Mohammad Parvez on 20/02/23.
//

import SwiftUI
import UnlimintSDK_SwiftUI
import UnlimintSDK_Core

enum SheetType {
    case payment
    case bind
    case statusView
    case recurringCardToken
    case recurringCardPayment

    //case none
}

struct HomeView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    
    init() {
        
        homeViewModel = HomeViewModel()
    }
    
    var body: some View {
        
//        ScrollView (.vertical,  showsIndicators: false){
            
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
                            
                            Text((homeViewModel.price.toPrice() ?? "0") + " \(homeViewModel.currency)")
                                .font(.footnote)
                        }
                    }
                    .padding()
                    Spacer()
                    
                    // Buy Button
                    Button {
                        
                        homeViewModel.payWithCardToken = false
                        homeViewModel.authorizationProvider.setup { newtoken in
                            
                            homeViewModel.sheetType = .payment
                            homeViewModel.token = newtoken
                            homeViewModel.showSheet = true
                        }
                        
                    } label: {
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 5.0)
                                .frame(maxHeight: 45)
                                .accentColor(Color("AccentColor"))
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                            
                            Text("Pay")
                                .foregroundColor(.blue)
                            // .background(Color.clear)
                                .accentColor(.black)
                        }
                    }
                    
                    // Recurring Pay with Card
                    Button {
                        
                        homeViewModel.payWithCardToken = false
                        homeViewModel.authorizationProvider.setup { newtoken in
                            
                            DispatchQueue.main.async {
                                homeViewModel.sheetType = .recurringCardPayment
                                homeViewModel.token = newtoken
                                homeViewModel.showSheet = true
                            }
                        }
                        
                    } label: {
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 5.0)
                                .frame(maxHeight: 45)
                                .accentColor(Color("AccentColor"))
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                            
                            Text("Recurring Pay with Card")
                                .foregroundColor(.blue)
                            // .background(Color.clear)
                                .accentColor(.black)
                        }
                    }
                    
                    // Recurring Pay with Token
                    Button {
                        
                        homeViewModel.payWithCardToken = false
                        homeViewModel.authorizationProvider.setup { newtoken in
                            
                            DispatchQueue.main.async {
                                homeViewModel.sheetType = .recurringCardToken
                                homeViewModel.token = newtoken
                                homeViewModel.showSheet = true
                            }
                        }
                        
                    } label: {
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 5.0)
                                .frame(maxHeight: 45)
                                .accentColor(Color("AccentColor"))
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                            
                            Text("Recurring Pay with Token")
                                .foregroundColor(.blue)
                            // .background(Color.clear)
                                .accentColor(.black)
                        }
                    }
                    
                    
                    // Link a Card
                    Button {
                        
                        homeViewModel.sheetType = .bind
                        homeViewModel.authorizationProvider.setup { newtoken in
                            homeViewModel.token = newtoken
                            homeViewModel.showSheet = true
                        }
                        
                    } label: {
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 5.0)
                                .frame(maxHeight: 45)
                                .foregroundColor(.clear)
                            Text("Link a card")
                                .underline()
                                .foregroundColor(.blue)
                            //.background(.clear)
                        }
                    }
                    
                    
                    if homeViewModel.isCardTokenGenerated {
                        
                        Button {
                            
                            homeViewModel.sheetType = .payment
                            homeViewModel.payWithCardToken = true
                            homeViewModel.authorizationProvider.setup { newtoken in
                                homeViewModel.token = newtoken
                                homeViewModel.showSheet = true
                            }
                            
                        } label: {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 5.0)
                                    .frame(maxHeight: 50)
                                    .foregroundColor(.clear)
                                Text("Pay with card Token \(homeViewModel.getPan())")
                                    .underline()
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
//        }
        
        .sheet(isPresented: $homeViewModel.showSheet) {
            
            switch homeViewModel.sheetType {
                
            case .payment :
                
                if homeViewModel.isCardTokenGenerated && homeViewModel.payWithCardToken {
                    
                    Unlimint.shared.checkout(for: homeViewModel.token, with: homeViewModel.payWithTokenData)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("Unlimint SDK")
                }
                else if homeViewModel.testRedirectToPayment {
                    
                    Unlimint.shared.checkout(for: homeViewModel.token, with: [homeViewModel.getCardDemoData()])
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("Unlimint SDK")
                }
                else if homeViewModel.testRedirectToToken {
                    
                    Unlimint.shared.checkout(for: homeViewModel.token, with: [homeViewModel.getCardTokenDemoData()])
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("Unlimint SDK")
                }
                else if homeViewModel.testRedirectToPaypal {
                    
                    Unlimint.shared.checkout(for: homeViewModel.token, with: [homeViewModel.getPaypalDemoData()])
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("Unlimint SDK")
                }
                else {
                    
                    Unlimint.shared.checkout(for: homeViewModel.token, with: homeViewModel.getCheckoutDemoData())
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("Unlimint SDK")
                    //.presentationDetents([.height(450)])
                }
            case .bind :
                
                Unlimint.shared.bind(for: homeViewModel.token, with:BindingMethodData(currency: .init(with: "EUR"), customer: .init(id: "test", email:"test@unlimint.com")))
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Unlimint SDK")
                //.presentationDetents([.height(450)])
                
                
            case .statusView:
                StatusView(statusModel: homeViewModel.getStatusModel()!, isFailedStatus: homeViewModel.failedStatus)
            case .recurringCardToken:
                Unlimint.shared.recuringPayment(for: homeViewModel.token, with: [homeViewModel.getRecurringTokenData()])
            case .recurringCardPayment:
                Unlimint.shared.recuringPayment(for: homeViewModel.token, with: [homeViewModel.getRecurringCardPaymentData()])
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
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
