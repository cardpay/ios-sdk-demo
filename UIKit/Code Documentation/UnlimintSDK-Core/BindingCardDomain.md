# BindingCardDomain

Binding bank card

``` swift
public class BindingCardDomain
```

Payment flow consists of 3 consecutive steps:

  - bindCard(for requisites: CardRequisites, data: BindingMethodData, completion: @escaping BindingClosure) - send bank card data and another binding data

  - show WebView with redirectUrl from first step

  - onUserNavigateTo(url: URL) - Check result of payment operation by redirect url from webView

## Nested Type Aliases

### `BindingClosure`

Completion closure for binding method

``` swift
public typealias BindingClosure = (Result<BindingResultModel, UnlimintErrors>) -> Void
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

### `bindCard(for:data:completion:)`

``` swift
func bindCard(for requisites: CardRequisites, data: BindingMethodData, completion: @escaping BindingClosure)
```

> 

#### Parameters

  - requisites: Binding card requisites
  - data: The data required for binding.
  - completion: A closure that returns the result of the map binding.

### `onUserNavigateTo(url:)`

Check result of operation by redirect url from webView.

``` swift
func onUserNavigateTo(url: URL) -> WebNavigationResults
```

#### Parameters

  - url: URL by which the redirect to the webView occurs.

#### Returns

WebNavigationResult:​ URL verification result
