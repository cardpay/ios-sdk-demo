# CardRequisites

Data model, for transmitting card details

``` swift
public struct CardRequisites
```

## Initializers

### `init(cardNumber:expireDate:cvc:)`

Initializer for model

``` swift
public init(cardNumber: String, expireDate: Date, cvc: String)
```

## Properties

### `cardNumber`

Bank card number

``` swift
let cardNumber: String
```

### `expireDate`

Expiration date

``` swift
let expireDate: Date
```

### `cvc`

Verification Code

``` swift
let cvc: String
```
