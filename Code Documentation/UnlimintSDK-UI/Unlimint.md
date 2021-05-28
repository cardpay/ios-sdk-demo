# Unlimint

``` swift
public final class Unlimint
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

### `bindNewCardFor(for:with:presentationStyle:)`

Use this method for binding card.

``` swift
func bindNewCardFor(for mobileToken: String, with data: BindingMethodData, presentationStyle style: PresentationStyle)
```

### `payment(for:with:presentationStyle:)`

Use this method for payment.

``` swift
func payment(for mobileToken: String, with data: PaymentMethodData, presentationStyle style: PresentationStyle)
```

### `paymentWithToken(for:with:presentationStyle:)`

Use this method for payment.

``` swift
func paymentWithToken(for mobileToken: String, with data: PaymentTokenMethodData, presentationStyle style: PresentationStyle)
```

### `paypalPayment(for:with:presentationStyle:)`

Use this method for paypal payment.

``` swift
func paypalPayment(for mobileToken: String, with data: PaypalPaymentMethodData, presentationStyle style: PresentationStyle)
```
