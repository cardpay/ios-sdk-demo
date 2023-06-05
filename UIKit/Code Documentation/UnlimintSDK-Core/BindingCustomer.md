# BindingCustomer

Binding customer data model

``` swift
public struct BindingCustomer: Codable
```

## Inheritance

`Codable`

## Initializers

### `init(id:email:locale:phone:homePhone:workPhone:)`

Initializer

``` swift
public init(id: String, email: String, locale: String? = nil, phone: String? = nil, homePhone: String? = nil, workPhone: String? = nil)
```

## Properties

### `id`

Customer ID is a unique identifier of a cardholder at the Recurring payments service. Each card used by a cardholder within the service is linked to Customer ID and Filing ID.

``` swift
let id: String
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

### `phone`

Customer’s phone number
Recommended to send phone number in following format "+1 111111111" with country code and subscriber sections (only digits are accepted) of the number, "+" as prefix and "space" as delimiter.
Refer to ITU-E.164 for additional information on format and length.
Mandatory for wallets where setting in PM "May omit customer email" is enabled and customer.email isn't presented in request

``` swift
let phone: String?
```

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
