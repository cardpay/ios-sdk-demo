Unlimint SDK
========

Unlimint mobile SDK helps you to implement payments in your application. Release 2.0.8 version supports following methods:
- binding card for further recurring payments,
- checking which payment methods are available for you,
- payment with new bank card,
- payment with saved bank card (token),
- recurring with new bank card,
- recurring with saved bank card (token),
- payment with PayPal.

Unlimint SDK has two parts: SDK UI and SDK Core.
SDK UI already contains SDK Core. The former has user interface, root detection and simplified API. It securely collects and transmits user card data. The latter has only payment methods.
We strongly recommend to use SDK UI if you don't have PCI DSS certificate.


# Installation 

### Requirements

- iOS 14.0+
- Swift 5.3
- Xcode 15.0+

## Swift Package manager

The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler.
Once you have your Swift package set up, adding UnlimitSDK as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```ruby
dependencies: [
    .package(url: "https://github.com/cardpay/unlimit-ios-sdk.git", .upToNextMajor(from: "2.1.0"))
]
```

## Cocoapod 

For Unlimint SDK SwiftUI
```ruby

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/cardpay/ios-sdk-podspec.git'

platform :ios, '14'
use_frameworks!

target 'UnlimintSDKSwiftUI-Demo' do

  pod 'UnlimintSDK_SwiftUI', '2.0.7'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
          xcconfig_path = config.base_configuration_reference.real_path
          xcconfig = File.read(xcconfig_path)
          xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
          File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
        end
    end
end

```

Then run `pod install` command. For details of the installation and usage of CocoaPods, visit [its official website](https://cocoapods.org).

## Carthage 

Carthage is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate UnlimitSDK into your Xcode project using Carthage, specify it in your Cartfile:

Instal Carthage (https://github.com/Carthage/Carthage#installing-carthage)
Add framework in project

### add in Cartfile 

```ruby
binary "https://storage.googleapis.com/unl_ios/Carthage/UnlimintSwiftUI.json"
```

### Add in Cartfile.private

```ruby
binary "https://storage.googleapis.com/unl_ios/Carthage/UnlimintCore.json"
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
