//
//  HomeViewModel.swift
//  SwiftUISDKTest
//
//  Created by Mohammad Parvez on 13/08/23.
//

import Foundation
import SwiftUI
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
    var failedStatus = false
    @Published var payWithCardToken = false
    
    
    var cardTokenData : PaymentTokenMethodData?
    
    init() {
        
        Unlimint.shared.environment = .sandbox
        Unlimint.shared.skipStatusPages = false
        Unlimint.shared.getCardBindingToken = self.get_card_Binding_Token
        Unlimint.shared.recurringScheduleType = .sa
        themeSetup()
        prepareCheckoutData()
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
        print(userInfo ?? [:])
        responseData = userInfo ?? [:]
        
        if userInfo!["UnlimintSDK.method"] as! String == "binding" {

            networkService.requestCardToken( userInfo!["UnlimintSDK.id"] as! String, onSuccess: { [self] cardToken in

                print(cardToken)

                    let token = cardToken.card.token
                    let cardType = cardToken.card.cardBrand
                    let pan = String(cardToken.card.maskedPan.suffix(4))
                    let cardHolder = cardToken.card.holder
                    let cardBrand = cardToken.card.cardBrand
                    let cardIssuer = cardToken.card.issuer
                
                    cardTokenData =  PaymentTokenMethodData.init(with: "Card Merchant",
                                                                 paymentMethod: "BANKCARD",
                                                                 customer: .init(homePhone: nil,
                                                                                 workPhone: nil,
                                                                                 email: "test@unlimint.com",
                                                                                 locale: "nil",
                                                                                 phone: "+91 8750119811",
                                                                                 ipAddress: nil,
                                                                                 customerID: nil),
                                                                 merchantOrder: .init(description: "<description>",
                                                                                      id: "\(generateRandomOrderID())"),
                                                                 paymentData: .init(amount: self.price,
                                                                                    currency: "EUR",
                                                                                    note: nil,
                                                                                    dynamicDescriptor: nil,
                                                                                    transType: nil,
                                                                                    isEditable: true,
                                                                                    preauth: true),
                                                                 cardAccount: .init(token: token,
                                                                                    pan: pan,
                                                                                    billingAddress: nil,
                                                                                    cardIssuer: cardIssuer))
                    
                    self.payWithTokenData.removeAll()
                    self.payWithTokenData.append(.cardToken(type: .mastercard, cardTokenData!))
                    self.checkoutData.removeAll()
                    prepareCheckoutData()
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
        else {
            
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

//        else if userInfo!["UnlimintSDK.method"] as! String == "paymentWithToken" {
//
//           // isShowStatus = false
//        }
//        else if userInfo!["UnlimintSDK.method"] as! String == "payPal" {
//
//           // isShowStatus = false
//        }
//        else if userInfo!["UnlimintSDK.method"] as! String == "paymentWithCard" {
//
//           // isShowStatus = false
//        }
    }
    
    private func eventUnlimintFailure(_ notification: Notification) {
       
        let userInfo = notification.userInfo
        print(userInfo)

        
        let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
        dispatchQueue.async{

            DispatchQueue.main.async{
              
              if Unlimint.shared.skipStatusPages == true {
                  self.showSheet = true
                  self.sheetType = .statusView
                  self.failedStatus = true
              }
           }
        }
        
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

        if let method = responseData["UnlimintSDK.method"], let uid = responseData["UnlimintSDK.id"] {
            return StatusModel(uid: uid as! String, pan: responseData["UnlimintSDK.pan"] as? String ?? "Paypal", method: method as! String, orderID: nil, amount: nil)
        }
        else {
            return StatusModel(uid: "", pan:"" , method:"", orderID: nil, amount: nil)
        }
    }
}


// Demo Data
extension HomeViewModel {
    
    func prepareCheckoutData() {
        
        checkoutData.append(getCardDemoData())
        checkoutData.append(getCardTokenDemoData())
        checkoutData.append(getPaypalDemoData())
    }
    
    func getCheckoutDemoData() -> [Unlimint.PaymentMethods] {
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
                                        phone: "+91 8750119811",
                                        ipAddress: nil,
                                        customerID: nil),
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
    
    func getRecurringCardPaymentData() -> Unlimint.PaymentMethods {
        
        return
        
            .recurringPaymentCard(.init(with: "Facebook Inc",
                                        paymentMethod: "BANKCARD",
                                        customer: .init(
                                                       email: "qwer@unlimint.com",
                                                       locale: nil,
                                                       
                                                       customerID: "123456"),
                                        merchantOrder: .init(description: "<description>", id: "\(generateRandomOrderID())"),
                                        paymentData: PaymentData.init(amount: 100,
                                                                      currency: "EUR",
                                                                      note: nil,
                                                                      dynamicDescriptor: nil,
                                                                      transType: nil,
                                                                      isEditable: false,
                                                                      preauth: true),
                                        cardAccount: nil,
                                        recurringData: .init(amount: 100,
                                                             currency: "EUR",
                                                             contractNumber:"7481592630ARDS",
                                                             transType: "01",
                                                             initialAmount: 100,
                                                             subscriptionStart: "2024-04-22",
                                                             plan: .init(id: "rf2391UU"))))
        
    }
    
    func getCardTokenDemoData() -> Unlimint.PaymentMethods {
        
        return
        
            .cardToken(type: .mastercard, .init(with: "Card Merchant",
                                                paymentMethod: "BANKCARD",
                                                customer: .init(homePhone: nil,
                                                                workPhone: nil,
                                                                email: "test@unlimint.com",
                                                                locale: "nil",
                                                                phone: "+91 8750119811",
                                                                ipAddress: nil,
                                                                customerID: nil),
                                                merchantOrder: .init(description: "<description>",
                                                                     id: "\(generateRandomOrderID())"),
                                                paymentData: .init(amount: price,
                                                                   currency: "EUR",
                                                                   note: nil,
                                                                   dynamicDescriptor: nil,
                                                                   transType: nil,
                                                                   isEditable: true,
                                                                   preauth: true),
                                                cardAccount: .init(token: "9cd57184-a7f9-33f6-8cf3-1298054515ac",
                                                                   pan: "0085",
                                                                   billingAddress: nil, cardIssuer: "ICICI Bank")))
        
    }
    
    func getRecurringTokenData() -> Unlimint.PaymentMethods {
        
        return
        
            .recurringCardToken(type: .mastercard, .init(with: "Card Merchant",
                                                         paymentMethod: "BANKCARD",
                                                         customer: .init(
                                                                        email: "test@unlimint.com",
                                                                         locale: "nil",
                                                                        customerID: "123456"),
                                                         merchantOrder: .init(description: "<description>",
                                                                              id: "\(generateRandomOrderID())"), 
                                                         paymentData: .init(amount: 100,
                                                                            currency: "EUR",
                                                                            note: nil,
                                                                            dynamicDescriptor: nil,
                                                                            transType: nil,
                                                                            isEditable: false,
                                                                            preauth: true),
                                                         cardAccount: .init(token: "9cd57184-a7f9-33f6-8cf3-1298054515ac",
                                                                            pan: "0085",
                                                                            billingAddress: nil, cardIssuer: "ICICI Bank"),
                                                         recurringData: .init(amount: 100,
                                                                              currency: "EUR",
                                                                              contractNumber:"7481592630ARDS",
                                                                              transType: "01",
                                                                              initialAmount: 100,
                                                                              subscriptionStart: "2024-04-22",
                                                                              plan: .init(id: "rf2391UU"))))
        
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
                                             isEditable: false,
                                             preauth: true),
                          customer: .init(email: "test@unlimint.com")))
        
    }
    
    
    func generateRandomOrderID() -> Int {
        
        Int.random(in: 111111..<999999)
        
    }
}

// Setting up theme
extension HomeViewModel {
    
    func themeSetup() {
        
        Unlimint.shared.theme.buttonBackgroundColor = Color(hex:0xFF5D15)
        Unlimint.shared.theme.buttonBackgroundColorDisable = .gray

        Unlimint.shared.theme.buttonTextColorColor = .white
        Unlimint.shared.theme.buttonTextColorColorDarkDisable = .black

        Unlimint.shared.theme.cardBackground =  Color(hex:0x272C34)
        Unlimint.shared.theme.cardBackgroundDark =  Color(hex:0x272C34)

        Unlimint.shared.theme.cardTextColor = .white
        Unlimint.shared.theme.cardTextColorDark = Color(hex:0xF2F4F8)

        Unlimint.shared.theme.cardInputTextColor = .black
        Unlimint.shared.theme.cardInputTextColorDark = Color(hex:0xF2F4F8)

        Unlimint.shared.theme.cardInputBackgroundColor = .white
        Unlimint.shared.theme.cardInputBackgroundColorDark = Color(hex:0x191A1C)

        Unlimint.shared.theme.topTitleTextColor = .black
        Unlimint.shared.theme.topTitleTextColorDark = Color(hex:0xF2F4F8)
        
        Unlimint.shared.theme.closeButtonTextColor = .blue

        Unlimint.shared.theme.pageBackgroundColor = .white
        Unlimint.shared.theme.pageBackgroundColorDark = Color.black

        Unlimint.shared.theme.changeAmountBGColor =  Color(hex: 0xe8e8eb)

        Unlimint.shared.theme.titleTextColor = .black
        Unlimint.shared.theme.titleTextColorDark = Color(hex: 0xF2F4F8)

        Unlimint.shared.theme.titleDetailTextColor = .gray

       // Unlimint.shared.theme.addCardText = "key1".localized
        
  
        
    }
}
