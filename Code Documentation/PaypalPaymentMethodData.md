# PaypalPaymentMethodData

``` swift
public struct PaypalPaymentMethodData: Codable
```

## Inheritance

`Codable`

## Initializers

### `init(merchantName:merchantOrder:paymentMethod:paymentData:customer:)`

``` swift
public init(merchantName: String, merchantOrder: PaymentMerchantOrder, paymentMethod: String, paymentData: PaymentData, customer: PaypalPaymentCustomer)
```

## Properties

### `merchantName`

The name of the merchant

``` swift
let merchantName: String
```
