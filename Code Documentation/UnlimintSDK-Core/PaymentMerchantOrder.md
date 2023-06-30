# PaymentMerchantOrder

Payment merchant order data model

``` swift
public struct PaymentMerchantOrder: Codable
```

## Inheritance

`Codable`

## Initializers

### `init(description:id:shippingAddress:items:)`

Initializer

``` swift
public init(description: String, id: String, shippingAddress: ShippingAddress? = nil, items: [Item]? = nil)
```

## Properties

### `id`

Order ID used by the merchant's shopping cart

``` swift
let id: String
```

### `description`

Description of product/service being sold

``` swift
let description: String
```

### `shippingAddress`

Shipping Address

``` swift
let shippingAddress: ShippingAddress?
```

### `items`

Array of items (in the shopping cart)

``` swift
let items: [Item]?
```
