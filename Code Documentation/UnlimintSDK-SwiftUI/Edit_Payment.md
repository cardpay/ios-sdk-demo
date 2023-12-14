# Edit Payment

``` swift
public struct PaymentData: Codable
```

## Properties

### `shared`

Singleton entity of UnlimintSDK

``` swift
let shared: Unlimint
```

### `theme`

Changing the subject field, you can customize the UI

``` swift
var theme: Theme
```

### `environment`

In this field, you can change the environment according to your needs.

``` swift
var environment: Environments
```

## Methods

### `bind(for:with:)`

Use this method for binding card.

``` swift
func bind(for mobileToken: String, with data: BindingMethodData)
```

### `payment(for:with:)`

Use this method for payment if multiple payment method then it will show a list and end user can select any one of them if only one method then i will directly rediret to payment method.


``` swift
func payment(for mobileToken: String, with methods: [PaymentMethods])
```
