# PayPalDomain

Payment with PayPal

``` swift
public class PayPalDomain
```

Payment flow consists of 3 consecutive steps:

  - pay(data: PaypalPaymentMethodData, completion: @escaping PayPalClosure) - send email data and another PayPaL data

  - show WebView with redirectUrl from first step

  - onUserNavigateTo(url: URL) - Check result of payment operation by redirect url from webView

## Nested Type Aliases

### `PayPalClosure`

Completion closure for PayPal method

``` swift
public typealias PayPalClosure = (Result<PaypalResultModel, UnlimintErrors>) -> Void
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

### `pay(data:completion:)`

``` swift
func pay(data: PaypalPaymentMethodData, completion: @escaping PayPalClosure)
```

> 

#### Parameters

  - data: PayPal requisites
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
