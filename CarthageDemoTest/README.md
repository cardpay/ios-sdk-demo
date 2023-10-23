Unlimint SDK
========

Unlimint mobile SDK helps you to implement payments in your application. Release 2.0.8 version supports following methods:
- binding card for further recurring payments,
- checking which payment methods are available for you,
- payment with new bank card,
- payment with saved bank card (token),
- payment with PayPal.

Unlimint SDK has two parts: SDK UI and SDK Core.
SDK UI already contains SDK Core. The former has user interface, root detection and simplified API. It securely collects and transmits user card data. The latter has only payment methods.
We strongly recommend to use SDK UI if you don't have PCI DSS certificate.

## DemoApp

[Download DemoApp via TestFlight](https://testflight.apple.com/join/1hfthfjp)

## Requirements

- iOS 15.0+
- Swift 5.3
- Xcode 15.0+
- Carthage 0.39.1

##  Installation Carthage (https://github.com/Carthage/Carthage#installing-carthage)


## Add framework in project

### add in Cartfile 

```ruby

binary "https://github.com/cardpay/ios-sdk-podspec/releases/download/2.0.8/UnlimintSwiftUI.json"

```

### Add in Cartfile.private

```ruby
binary "https://github.com/cardpay/ios-sdk-podspec/releases/download/2.0.8/UnlimintCore.json"
github "Alamofire/Alamofire" "5.8.0"
github "Moya/Moya" "15.0.3"
github "ReactiveCocoa/ReactiveSwift" "6.7.0"
github "ReactiveX/RxSwift" "6.6.0"
github "Swinject/Swinject" "2.8.4"

```

### Run command to install Framework 
```ruby 

carthage update --use-xcframeworks --platform iOS 

```

### Add framework in project 


Select below framework and Drag the built .xcframeworks bundles from Carthage/Build into the "Frameworks and Libraries" section of your application’s Xcode project.

1. Alamofire.xcframework
2. Moya.xcframework
3. Swinject.xcframework
4. UnlimintSDK_Core.xcframework
5. UnlimintSDK_SwiftUI.xcframework

