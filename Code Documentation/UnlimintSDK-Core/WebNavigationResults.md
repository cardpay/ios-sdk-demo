# WebNavigationResults

``` swift
@frozen public enum WebNavigationResults
```

  - Result of checking redirect url of WebView

  - 
## Enumeration Cases

### `success`

``` swift
case success
```

  - Web operation successfully passed

### `decline`

``` swift
case decline
```

  - Web operation is declined

### `invalid`

``` swift
case invalid
```

  - Security error. url is invalid. Web flow should be closed with error

### `skip`

``` swift
case skip
```

  - Load this url
