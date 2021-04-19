# Unlimint.NotificationKeys

``` swift
public enum NotificationKeys
```

## Inheritance

`String`

## Enumeration Cases

### `cardRecurringIdNotificationKey`

Event - onCardRecurringIdReceived.

``` swift
case cardRecurringIdNotificationKey
```

Key in userInfo notification.

### `paymentIdNotificationKey`

Event - onPaymentIdReceived.

``` swift
case paymentIdNotificationKey
```

Key in userInfo notification.

### `authorizationResultKey`

Event - onPaymentVerificationFinished, onBindingVerificationFinished.

``` swift
case authorizationResultKey
```

Key in userInfo notification. The value contains the authorization result.

### `panNotificationKey`

Event - onPaymentIdReceived.

``` swift
case panNotificationKey
```

Key in userInfo notification.

### `serviceUnavailableNotificationKey`

Event - onServiceUnavailableException.

``` swift
case serviceUnavailableNotificationKey
```

Key in userInfo notification.

### `unauthorizedExceptionNotificationKey`

Event - onUnauthorizedFailure.

``` swift
case unauthorizedExceptionNotificationKey
```

Key in userInfo notification.

### `mobileTokenNotificationKey`

Event - onUnauthorizedFailure.

``` swift
case mobileTokenNotificationKey
```

Key in userInfo notification.
