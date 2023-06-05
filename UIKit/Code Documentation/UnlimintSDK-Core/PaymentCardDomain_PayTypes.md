# PaymentCardDomain.PayTypes

Payment variants for methods

``` swift
public enum PayTypes
```

## Enumeration Cases

### `token`

Payment with card token

``` swift
case token(requisites: TokenPaymentRequisites, data: PaymentTokenMethodData)
```

### `card`

Payment with card

``` swift
case card(requisites: CardPaymentRequisites, data: PaymentMethodData)
```
