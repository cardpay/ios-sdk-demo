# PaymentCustomer

Customer data model

``` swift
public struct PaymentCustomer: Codable
```

## Inheritance

`Codable`

## Initializers

### `init(homePhone:workPhone:email:locale:)`

Initializer

``` swift
public init(homePhone: String?, workPhone: String?, email: String, locale: String?)
```

## Properties

### `homePhone`

The home phone number provided by the Cardholder. Required (if available) unless market or regional mandate restricts sending this information.
Characters format:​ recommended to send phone number in following format "+1 111111111" with country code and subscriber sections (only digits are accepted) of the number, "+" as prefix and "space" as delimiter.
Refer to ITU-E.164 for additional information on format and length.
Field will be ignored if filing.id is presented in request (continue one-click scenario)

``` swift
let homePhone: String?
```

### `workPhone`

The work phone number provided by the Cardholder. Required (if available) unless market or regional mandate restricts sending this information.
Characters format:​ recommended to send phone number in following format "+1 111111111" with country code and subscriber sections (only digits are accepted) of the number, "+" as prefix and "space" as delimiter.
Refer to ITU-E.164 for additional information on format and length.
Field will be ignored if filing.id is presented in request (continue one-click scenario)

``` swift
let workPhone: String?
```

### `email`

Customer’s e-mail address
Optional for wallets where setting in PM "May omit customer email" is enabled

``` swift
let email: String
```

### `locale`

Preferred locale for the payment page (ISO 639-1 language code).
The default locale (en or other locale if it's set as default in Merchant account) will be applied if the selected locale (received in request) is not supported.
Supported locales are:​ ar, az, bg, cs, de, el, en, es, fr, hu, hy, id, it, ja, ka, ko, ms, nl, pl, pt, ro, ru, sr, sv, th, tr, uk, vi, zh

``` swift
let locale: String?
```
