# PaypalPaymentMethodData

Data model

``` swift
public struct PaypalPaymentMethodData: Codable
```

## Inheritance

`Codable`

## Initializers

### `init(merchantName:merchantOrder:paymentMethod:paymentData:customer:)`

Initializer for model

``` swift
public init(merchantName: String, merchantOrder: PaymentMerchantOrder, paymentMethod: String, paymentData: PaymentData, customer: PaypalPaymentCustomer)
```

## Properties

### `merchantName`

The name of the merchant

``` swift
let merchantName: String
```

### `merchantOrder`

Merchant order data

``` swift
let merchantOrder: PaymentMerchantOrder
```

### `paymentMethod`

Payment method type name

``` swift
let paymentMethod: String
```

### `paymentData`

Payment data

``` swift
let paymentData: PaymentData
```

### `customer`

Customer data

``` swift
var customer: PaypalPaymentCustomer
```
