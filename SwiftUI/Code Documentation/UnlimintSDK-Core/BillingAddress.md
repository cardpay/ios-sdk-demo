# BillingAddress

``` swift
public struct BillingAddress: Codable
```

## Inheritance

`Codable`

## Initializers

### `init(country:state:zip:city:addrLine1:addrLine2:)`

``` swift
public init(country: String, state: String?, zip: String, city: String, addrLine1: String, addrLine2: String?)
```

## Properties

### `country`

ISO 3166-1 code of billing country:​ 2 or 3 latin letters or numeric code

``` swift
let country: String
```

### `state`

The state or province of the billing address associated with the card being used for this purchase.
It's recommended to sent in following format:​ The country subdivision code defined in ISO 3166-2.
May include whitespaces, hyphens, apostrophes, commas and dots

``` swift
let state: String?
```

### `zip`

Billing postal code

``` swift
let zip: String
```

### `city`

Billing city. May include whitespaces, hyphens, apostrophes, commas and dots

``` swift
let city: String
```

### `addrLine1`

First line of the street address or equivalent local portion of the Cardholder billing address associated with the card used for this purchase.
May include whitespaces, hyphens, apostrophes, commas, quotes, dots, slashes and semicolons.
Required (if available) unless market or regional mandate restricts sending this information.
Field will be ignored if filing.id is presented in request (continue one-click scenario)

``` swift
let addrLine1: String
```

### `addrLine2`

Second line of the street address or equivalent local portion of the Cardholder billing address associated with the card used for this purchase. Required (if available) unless market or regional mandate restricts sending this information.
Field will be ignored if filing.id is presented in request (continue one-click scenario)

``` swift
let addrLine2: String?
```
