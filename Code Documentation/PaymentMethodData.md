# PaymentMethodData

``` swift
public struct PaymentMethodData: Codable
```

## Inheritance

`Codable`

## Initializers

### `init(with:paymentMethod:customer:merchantOrder:paymentData:cardAccount:)`

``` swift
public init(with merchantName: String, paymentMethod: String, customer: PaymentCustomer, merchantOrder: PaymentMerchantOrder, paymentData: PaymentData, cardAccount: CardAccount?)
```

## Properties

### `merchantName`

The name of the merchant

``` swift
let merchantName: String
```

### `paymentMethod`

Payment method type name

``` swift
let paymentMethod: String
```

### `customer`

Customer data

``` swift
let customer: PaymentCustomer
```

### `merchantOrder`

Merchant order data

``` swift
let merchantOrder: PaymentMerchantOrder
```

### `paymentData`

Payment data

``` swift
let paymentData: PaymentData
```

### `cardAccount`

Card account data

``` swift
let cardAccount: CardAccount?
```
