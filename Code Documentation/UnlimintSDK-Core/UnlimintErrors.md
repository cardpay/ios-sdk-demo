# UnlimintErrors

``` swift
public enum UnlimintErrors
```

  - Exceptions that can be thrown by Unlimint Sdk

## Inheritance

`CustomDebugStringConvertible`, `Error`

## Enumeration Cases

### `unauthorized`

Unauthorized exception

``` swift
case unauthorized(token: String)
```

#### Parameters

  - token: token, which was used in request

### `security`

``` swift
case security(: [String: String])
```

  - Security exception

### `serviceUnavailable`

``` swift
case serviceUnavailable
```

  - Some io errors

### `invalidData`

``` swift
case invalidData(: Error)
```

  - Error while handling requisites data

### `networkConnection`

``` swift
case networkConnection(: Error)
```

  - No internet connection

### `` `internal` ``

``` swift
case `internal`(: Error)
```

  - Wrapper for all internal errors in sdk

## Properties

### `debugDescription`

``` swift
var debugDescription: String
```
