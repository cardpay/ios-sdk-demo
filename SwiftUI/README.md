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

- iOS 14.0+
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

platform :ios, '14'
use_frameworks!

target 'UnlimintSDKSwiftUI-Demo' do

  pod 'UnlimintSDK_SwiftUI', '2.0.0'

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

platform :ios, '13.0'
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


## Link Framework 

- if UnlimintSDK_SwiftUI not linked then link UnlimintSDK_SwiftUI manually into your project
- Go to project General -> Framework -> add framework UnlimintSDK_SwiftUI from Pod file. 
