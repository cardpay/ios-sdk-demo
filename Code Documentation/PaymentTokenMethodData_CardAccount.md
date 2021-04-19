# PaymentTokenMethodData.CardAccount

``` swift
public struct CardAccount: Codable
```

## Inheritance

`Codable`

## Initializers

### `init(token:pan:billingAddress:)`

``` swift
public init(token: String, pan: String, billingAddress: BillingAddress?)
```

## Properties

### `token`

Card token value, used instead of card information, except card.security\_code (it's mandatory)

``` swift
let token: String
```

### `pan`

The last 4 digits of the card number

``` swift
let pan: String
```

### `billingAddress`

Billing Address

``` swift
let billingAddress: BillingAddress?
```
