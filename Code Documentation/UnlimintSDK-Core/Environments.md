# Environments

List of environments

``` swift
public enum Environments
```

## Inheritance

`CaseIterable`, `String`

## Enumeration Cases

### `sandbox`

Case for testing the functionality

``` swift
case sandbox
```

### `production`

<dl>
<dt><code>PRODUCTION</code></dt>
<dd>

Case for production

``` swift
case production
```

</dd>
</dl>

### `testCyprus`

<dl>
<dt><code>!((PRODUCTION))</code></dt>
<dd>

``` swift
case testCyprus
```

</dd>
</dl>

### `testCyprusNon3dsBinding`

<dl>
<dt><code>!((PRODUCTION))</code></dt>
<dd>

``` swift
case testCyprusNon3dsBinding
```

</dd>
</dl>

### `nsk`

<dl>
<dt><code>!((PRODUCTION))</code></dt>
<dd>

``` swift
case nsk
```

</dd>
</dl>

## Properties

### `current`

You can use this property to set the environments that the SDK should run on.

``` swift
var current: Environments = .sandbox
```
