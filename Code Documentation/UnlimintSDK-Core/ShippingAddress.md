# ShippingAddress

Shipping address data model

``` swift
public struct ShippingAddress: Codable
```

## Inheritance

`Codable`

## Properties

### `country`

ISO 3166-1 code of delivery country:​ 2 or 3 latin letters or numeric code
Required for BANKCARD payment method, if shipping\_address is presented

``` swift
let country: String?
```

### `state`

The state or province of the shipping address associated with the card being used for this purchase.
It's recommended to send in following format:​ The country subdivision code defined in ISO 3166-2.
May include whitespaces, hyphens, apostrophes, commas and dots

``` swift
let state: String?
```

### `zip`

Delivery postal code.
For BANKCARD payment method - max length 12

``` swift
let zip: String?
```

### `city`

Delivery city. May include whitespaces, hyphens, apostrophes, commas and dots

``` swift
let city: String?
```

### `phone`

Valid customer phone number

``` swift
let phone: String?
```

### `addrLine1`

First line of the street address or equivalent local portion of the Cardholder shipping address associated with the card used for this purchase. Can include street and house number

``` swift
let addrLine1: String?
```

### `addrLine2`

Second line of the street address or equivalent local portion of the Cardholder shipping address associated with the card used for this purchase.

``` swift
let addrLine2: String?
```
