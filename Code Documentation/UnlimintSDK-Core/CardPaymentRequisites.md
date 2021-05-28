# CardPaymentRequisites

Data model, for transmitting card details

``` swift
public struct CardPaymentRequisites
```

## Initializers

### `init(cardNumber:expireDate:cvc:isGenerateToken:)`

Initializer for model

``` swift
public init(cardNumber: String, expireDate: Date, cvc: String, isGenerateToken: Bool)
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

### `isGenerateToken`

Flag that indicates whether the card needs to be tokenized.

``` swift
let isGenerateToken: Bool
```

### Note

  - If `true`, card token will be generated.
