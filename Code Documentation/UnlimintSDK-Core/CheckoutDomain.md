# CheckoutDomain

``` swift
public class CheckoutDomain
```

## Nested Type Aliases

### `CheckoutClosure`

``` swift
public typealias CheckoutClosure = (Result<[AvailablePaymentMethod], UnlimintErrors>) -> Void
```

## Initializers

### `init(with:)`

``` swift
public init(with mobieToken: String)
```

## Methods

### `availableMethods(completion:)`

``` swift
func availableMethods(completion: @escaping CheckoutClosure)
```
