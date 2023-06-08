# PaymentData

Payment data model

``` swift
public struct PaymentData: Codable
```

## Inheritance

`Codable`

## Initializers

### `init(amount:currency:note:dynamicDescriptor:transType:)`

Initializer

``` swift
    public init(amount: Decimal,
                currency: String,
                note: String?,
                dynamicDescriptor: String?,
                transType: String?,
                isEditable: Bool = false)
```

## Properties

### `amount`

The total transaction amount in selected currency with dot as a decimal separator, must be less than 100 millions

``` swift
let amount: Decimal
```

### `currency`

ISO 4217 currency code

``` swift
let currency: String
```

### `note`

Note about the transaction that will not be displayed to customer

``` swift
let note: String?
```

### `dynamicDescriptor`

Short description of the service or product, must be enabled by Unlimint manager to be used.
For Visa cards:​ maximum length 25 symbols, for MasterCard cards - 22 symbols.

``` swift
let dynamicDescriptor: String?
```

### `transType`

Identifies the type of transaction being authenticated.

``` swift
let transType: String?
```


### `isEditable`

If want to give change amount make it true. default is false in initializer

``` swift
public var isEditable: Bool
```

Values accepted:

  - 01 - Goods/ Service Purchase

  - 03 - Check Acceptance

  - 10 - Account Funding • 11 = Quasi-Cash Transaction

  - 28 - Prepaid Activation and Load Note: Values derived from the 8583 ISO Standard.
