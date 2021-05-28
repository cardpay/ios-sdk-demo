Unlimint SDK
========

[Download to TestFlight](https://testflight.apple.com/join/1hfthfjp)

## Requirements

- iOS 11.0+
- Swift 5.3
  - Xcode 12.0+
- CocoaPods 1.10.0+ (if you use)

## Installation

UnlimintSDK is available through [CocoaPods](https://cocoapods.org)

#### Swift 5.x

```ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/cardpay/ios-sdk-podspec.git'

target 'UnlimintSDK-Demo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CardPaySDK_DemoShop
  pod 'UnlimintSDK'

end

unlimintXCFramework = ['Alamofire', 'Moya', 'Swinject', 'UnlimintSDK']

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if unlimintXCFramework.include? "#{target}"
            target.build_configurations.each do |config|
                config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
            end
        end
    end
end

```

Then run `pod install` command. For details of the installation and usage of CocoaPods, visit [its official website](https://cocoapods.org).

## Documentation

- [Technical documents](./Docs).
- [Code documentation](<./Code Documentation/Home.md>).

## Contribution Guide

A guide to [submit issues](https://github.com/cardpay/ios-sdk-demo/issues), to ask general questions, or to [open pull requests](https://github.com/cardpay/ios-sdk-demo/pulls).
