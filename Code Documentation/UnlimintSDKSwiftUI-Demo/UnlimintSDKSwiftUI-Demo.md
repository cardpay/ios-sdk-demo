# UnlimintSDKSwiftUI-Demo -> ContentView

``` swift
struct ContentView: View 
```

## Property

### authorizationProvider

It will be used to generate token

``` swift
private let authorizationProvider: AuthorizationProvider = .init()
```

### testRedirectToPayment

This property is only for testing purpose 

This will use to test direct payment to end used. If array object will have only one payment method then end user will directly redirect to payment metod.

```swift
Unlimint.shared.checkout(for: token, with: [PaymentMethods])

// Card Example in PaymentMethods 

    .card(.init(with: "Facebook Inc",
        paymentMethod: "BANKCARD",
             customer: .init(homePhone: nil,
            workPhone: nil,
                email: "test@unlimint.com",
                locale: nil),
        merchantOrder: .init(description: "<description>", id: "<id>"),
          paymentData: .init(amount: price, currency: "EUR", note: nil, dynamicDescriptor: nil, transType: nil),
          cardAccount: nil))
          
```

## List of Payment Method 



```swift 
Unlimint.shared.checkout(for: token, with: [PaymentMethods1(card), PaymentMethods2(paypal), PaymentMethods3(Token1), PaymentMethods4(Token2)])

```

## Test Edit Payment 

### make isEditable = true in paymentData, default is false.

``` swift
             PaymentData.init(amount: price,
                            currency: "EUR",
                                note: nil,
                   dynamicDescriptor: nil,
                           transType: nil,
                          isEditable: true)
                          
```
