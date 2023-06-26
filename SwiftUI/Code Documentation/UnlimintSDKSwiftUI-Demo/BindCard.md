# Bind Card


## Use Bind method Unlimint.shared.bind()

Example 

``` swift

Unlimint.shared.bind(for: token, 
                    with:BindingMethodData(currency: .init(with: "EUR"), 
                                           customer: .init(id: "test", email:"test@unlimint.com")))

    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle("Unlimint SDK")
    
```


## Add theser observers 

### 
eventUnlimintSuccess : When  payment is success
eventUnlimintFailure : When Payment is failed
eventUnlimintFinished : When payment is completed and trying to close payment window

``` swift
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handle(notification:)),
                                               name: .eventUnlimintSuccess,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handle(notification:)),
                                               name: .eventUnlimintFailure,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handle(notification:)),
                                               name: .eventUnlimintFinished,
                                               object: nil)
```

### eventUnlimintSuccess and get id (recurring_id). 


## use recurring_id and get fillind.id

###
Follow the URL to get information about the recurring payment and get the filling.id
https://integration.unlimint.com/new/api-reference/d32cfbbd90466-get-recurring-information
###



## use fillinf.id and create the payment

###
Follow the instrusction 
https://integration.unlimint.com/new/api-reference/2958e6cd74e5f-create-recurring
###


