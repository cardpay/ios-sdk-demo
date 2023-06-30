# Item

Item data model

``` swift
public struct Item: Codable
```

## Inheritance

`Codable`

## Properties

### `name`

The name of product / service, provided to the customer

``` swift
let name: String
```

### `description`

The description of product / service, provided to the customer

``` swift
let description: String?
```

### `count`

The count of product / service, provided to the customer. Any positive number

``` swift
let count: Int?
```

### `price`

Price of product / service with dot as a decimal separator, must be less than a million

``` swift
let price: Float?
```
