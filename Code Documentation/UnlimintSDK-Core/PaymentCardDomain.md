# PaymentCardDomain

Pay with bank card or bank card token

``` swift
public class PaymentCardDomain
```

Payment flow consists of 3 consecutive steps:

  - pay(for type: PayTypes, completion: @escaping PaymentClosure) - send bank card data (requisites or token) and another payment data

  - show WebView with redirectUrl from first step

  - onUserNavigateTo(url: URL) - Check result of payment operation by redirect url from webView

## Nested Type Aliases

### `PaymentClosure`

Completion closure for payment method

``` swift
public typealias PaymentClosure = (Result<PaymentResultModel, UnlimintErrors>) -> Void
```

## Initializers

### `init(token:)`

Domain initializer.

``` swift
public init(token: String)
```

### Notes:

  - The mobile token is a one-time token

#### Parameters

  - token: Mobile token generated on the merchant's server

## Methods

### `pay(for:completion:)`

``` swift
func pay(for type: PayTypes, completion: @escaping PaymentClosure)
```

> 

#### Parameters

  - type: Payment variant
  - completion: Callback of result payment request

### `onUserNavigateTo(url:)`

Check result of operation by redirect url from webView.

``` swift
func onUserNavigateTo(url: URL) -> WebNavigationResults
```

#### Parameters

  - url: URL by which the redirect to the webView occurs.

#### Returns

WebNavigationResult:​ URL verification result
