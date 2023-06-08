# BindingMethodData

Binding method data model

``` swift
public struct BindingMethodData: Codable
```

## Inheritance

`Codable`

## Initializers

### `init(currency:customer:merchantOrder:cardAccount:)`

Initializer

``` swift
public init(currency: Currency, customer: BindingCustomer, merchantOrder: MerchantOrder? = nil, cardAccount: CheckCardAccount? = nil)
```

## Properties

### `currency`

The currency for the lowest payment from card for binding

``` swift
let currency: Currency
```

### `customer`

Customer data

``` swift
let customer: BindingCustomer
```

### `merchantOrder`

Merchant order data

``` swift
let merchantOrder: MerchantOrder?
```

### `cardAccount`

Card account data

``` swift
let cardAccount: CheckCardAccount?
```
