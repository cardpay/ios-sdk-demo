//
//  HomeViewModel.swift
//  SwiftUISDKTest
//
//  Created by Mohammad Parvez on 13/08/23.
//

import Foundation
import UnlimintSDK_SwiftUI
import UnlimintSDK_Core

class HomeViewModel : ObservableObject {
    
    var checkoutData : [Unlimint.PaymentMethods] = []
    var payWithTokenData : [Unlimint.PaymentMethods] = []
    var responseData : [AnyHashable : Any] = [:]

    
    @Published var authorizationProvider: AuthorizationProvider = .init()
    @Published var networkService: NetworkService = .init()

    @Published var price: Decimal  = 6
    @Published var isShowStatus = false
    @Published var showSheet = false
    @Published var token : String = ""
    @Published var sheetType : SheetType = .payment
    @Published var testRedirectToPaypal = false
    @Published var testRedirectToToken = false
    @Published var testRedirectToPayment = false
    @Published var currency : String = "EUR"
    @Published var isPayment = true
    @Published var get_card_Binding_Token = true
    
    var isCardTokenGenerated = false
    @Published var payWithCardToken = false
    
    
    var cardTokenData : PaymentTokenMethodData?
    
    init() {
        
        Unlimint.shared.environment = .sandbox
        Unlimint.shared.skipStatusPages = true
        Unlimint.shared.get_card_Binding_Token = self.get_card_Binding_Token
        addEventFailure()
        addEventSuccessful()
    }
    
    
    private func addEventFailure() {
        
        NotificationCenter.default.addObserver(forName: .eventUnlimintFailure, object: nil, queue: nil) { notification in
            self.eventUnlimintFailure(notification)
        }
    }
    
    private func addEventSuccessful() {
        
        NotificationCenter.default.addObserver(forName: .eventUnlimintSuccess, object: nil, queue: nil) { [self] notification in
            eventUnlimintSuccess(notification)
        }
    }
    
    
    private func eventUnlimintSuccess(_ notification: Notification) {
        
        let userInfo = notification.userInfo
        print(userInfo)
        responseData = userInfo ?? [:]
        
        if userInfo!["UnlimintSDK.method"] as! String == "binding" {

            networkService.requestCardToken( userInfo!["UnlimintSDK.id"] as! String, onSuccess: { [self] cardToken in

                print(cardToken)

                    
                    let token = cardToken.card.token
                    let cardType = cardToken.card.cardBrand
                    let pan = String(cardToken.card.maskedPan.suffix(4))
                    let cardHolder = cardToken.card.holder
                    let cardBrand = cardToken.card.cardBrand
                    let cardAccount = PaymentTokenMethodData.CardAccount(token: token, pan: pan, billingAddress: nil)
                    
                    cardTokenData =  PaymentTokenMethodData.init(with: "Card Merchant",
                                                                 paymentMethod: "BANKCARD",
                                                                 customer: .init(homePhone: nil,
                                                                                 workPhone: nil,
                                                                                 email: "test@unlimint.com",
                                                                                 locale: "nil",
                                                                                 phone: "+91 8750119811"),
                                                                 merchantOrder: .init(description: "<description>",
                                                                                      id: "\(generateRandomOrderID())"),
                                                                 paymentData: .init(amount: self.price,
                                                                                    currency: "EUR",
                                                                                    note: nil,
                                                                                    dynamicDescriptor: nil,
                                                                                    transType: nil,
                                                                                    isEditable: true, preauth: true),
                                                                 cardAccount: .init(token: token,
                                                                                    pan: pan,
                                                                                    billingAddress: nil))
                    
                    self.payWithTokenData.removeAll()
                    self.payWithTokenData.append(.cardToken(type: .mastercard, cardTokenData!))
                    self.checkoutData.removeAll()
                    self.checkoutData.append(.cardToken(type: .mastercard, cardTokenData!))
                
                let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
                dispatchQueue.async{
                  //Time consuming task here
                  DispatchQueue.main.async{
                      self.isCardTokenGenerated = true
                  }
                }

            }, onFailure: { errorMessage in
                print(errorMessage)
            })

            
            let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
            dispatchQueue.async{

                DispatchQueue.main.async{
                  
                  if Unlimint.shared.skipStatusPages == true {
                      self.showSheet = true
                      self.sheetType = .statusView
                  }
              }
            }
        }

        else if userInfo!["UnlimintSDK.method"] as! String == "paymentWithToken" {

           // isShowStatus = false
        }
        else if userInfo!["UnlimintSDK.method"] as! String == "payPal" {

           // isShowStatus = false
        }
        else if userInfo!["UnlimintSDK.method"] as! String == "paymentWithCard" {

           // isShowStatus = false
        }
    }
    
    private func eventUnlimintFailure(_ notification: Notification) {
       
        let userInfo = notification.userInfo
        print(userInfo)

        /*
         Optional([AnyHashable("UnlimintSDK.bindingError"):
         UnlimintSDK_SwiftUI.BindingErrors.decline,
         AnyHashable("UnlimintSDK.method"): "binding"])
         */

        // Do you stuff like
        // Card added susseccfully or Payment successfully complete.
        // show some status page or track order page
        //self.isShowStatus = false
    }
}


// Utility
extension HomeViewModel {
    
    func getPan() -> String {
        
        return (cardTokenData?.cardAccount.pan)!
    }
    
    func getStatusModel() -> StatusModel? {

        if let method = responseData["UnlimintSDK.method"], let uid = responseData["UnlimintSDK.id"], let pan = responseData["UnlimintSDK.pan"] {
            return StatusModel(uid: uid as! String , pan: pan as! String, method: method as! String, orderID: nil, amount: nil)
        }
        else {
            return nil
        }
    }
}


// Demo Data
extension HomeViewModel {
    
    func getCheckoutDemoData() -> [Unlimint.PaymentMethods] {
        
        checkoutData.append(getCardDemoData())
        checkoutData.append(getCardTokenDemoData())
        checkoutData.append(getPaypalDemoData())
        return checkoutData
    }
    
    func getCardDemoData() -> Unlimint.PaymentMethods {
        
        return
        
            .card(.init(with: "Facebook Inc",
                        paymentMethod: "BANKCARD",
                        customer: .init(homePhone: nil,
                                        workPhone: nil,
                                        email: "qwer@unlimint.com",
                                        locale: nil,
                                        phone: "+91 8750119811"),
                        merchantOrder: .init(description: "<description>", id: "\(generateRandomOrderID())"),
                        paymentData: PaymentData.init(amount: price,
                                                      currency: "EUR",
                                                      note: nil,
                                                      dynamicDescriptor: nil,
                                                      transType: nil,
                                                      isEditable: false,
                                                      preauth: true),
                        cardAccount: nil))
        
    }
    
    
    func getCardTokenDemoData() -> Unlimint.PaymentMethods {
        
        return
        
            .cardToken(type: .mastercard, .init(with: "Card Merchant",
                                                paymentMethod: "BANKCARD",
                                                customer: .init(homePhone: nil,
                                                                workPhone: nil,
                                                                email: "test@unlimint.com",
                                                                locale: "nil",
                                                                phone: "+91 8750119811"),
                                                merchantOrder: .init(description: "<description>",
                                                                     id: "\(generateRandomOrderID())"),
                                                paymentData: .init(amount: price,
                                                                   currency: "EUR",
                                                                   note: nil,
                                                                   dynamicDescriptor: nil,
                                                                   transType: nil,
                                                                   isEditable: false,
                                                                   preauth: true),
                                                cardAccount: .init(token: "a3d85ac0-4268-bb12-a628-f1e13a4988d8",
                                                                   pan: "1235",
                                                                   billingAddress: nil)))
        
    }
    
    func getPaypalDemoData() -> Unlimint.PaymentMethods {
        
        return
            .payPal(.init(merchantName: "Paypal Merchant",
                          merchantOrder: .init(description: "<description>",
                                               id: "\(generateRandomOrderID())"),
                          paymentMethod: "PAYPAL",
                          paymentData: .init(amount: price,
                                             currency: "EUR",
                                             note: nil,
                                             dynamicDescriptor: nil,
                                             transType: nil,
                                             isEditable: true, preauth: true),
                          customer: .init(email: "test@unlimint.com")))
        
    }
    
    
    func generateRandomOrderID() -> Int {
        
        Int.random(in: 111111..<999999)
        
    }
}
