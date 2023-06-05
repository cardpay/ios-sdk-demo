Unlimint SDK
========

Unlimint mobile SDK helps you to implement payments in your application. Release 1.8 version supports following methods:
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

- iOS 13.0+
- Swift 5.3
  - Xcode 14.0+
- CocoaPods 1.10.0+ (if you use)

## Installation

UnlimintSDK is available through [CocoaPods](https://cocoapods.org)

#### Swift 5.x

For Unlimint SDK UI
```ruby

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/cardpay/ios-sdk-podspec.git'

platform :ios, '11'
use_frameworks!

target 'UnlimintSDK-Demo' do

  pod 'UnlimintSDK_UI'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
                config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        end
    end
end

```

For Unlimint SDK Core
```ruby
source 'https://github.com/cardpay/ios-sdk-podspec.git'

platform :ios, '11.0'
use_frameworks!

pod 'UnlimintSDK-Core'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
                config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        end
    end
end

```

Then run `pod install` command. For details of the installation and usage of CocoaPods, visit [its official website](https://cocoapods.org).

## Basic Usage

#### Environment

```Swift
# For Unlimint SDK UI
Unlimint.shared.environment = .sandbox

# For Unlimint SDK Core
Environments.current = .sandbox

```

#### UI Customization

Find more details in [UI Customization](https://github.com/cardpay/ios-sdk-demo/wiki/SDK-UI-Customization).

```Swift
'Unlimint.shared.theme'

public struct Theme {

 public var navigationStyle: NavigationBarStyle
 
 public var mainButtonStyle: MainButtonStyle
 
 public var viewControllerStyle: ViewControllerStyle
 
 public init(navigationStyle: NavigationBarStyle = .init(bar: .largeNavBar,
                                                         statusBarStyle: .default,
                                                         navigationBarColor: .transparentDark,
                                                         tintColor: .clear), 
             mainButtonStyle: MainButtonStyle = .init(cornerRadius: 2,
                                      titleColor: (UIConstants.Colors.primaryBlack,
                                                   UIConstants.Colors.primaryGray),
                                      backgroundColor: (UIConstants.Colors.primaryGreen,
                                                        UIConstants.Colors.primaryWhite)),
             viewControllerStyle: ViewControllerStyle = .init(backgroundColor: .white))
}
```

## Documentation

- [Technical documents](https://github.com/cardpay/ios-sdk-demo/wiki).

- [UnlimintSDK-UI documentation](<./Code Documentation/UnlimintSDK-UI/Home.md>).
- [UnlimintSDK-Core documentation](<./Code Documentation/UnlimintSDK-Core/Home.md>).

## Contribution Guide

A guide to [submit issues](https://github.com/cardpay/ios-sdk-demo/issues), to ask general questions, or to [open pull requests](https://github.com/cardpay/ios-sdk-demo/pulls).
