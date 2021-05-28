# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/cardpay/ios-sdk-podspec.git'

platform :ios, '11'
use_frameworks!

target 'UnlimintSDK-Demo' do

  pod 'UnlimintSDK_UI', '~> 1.7'

end

unlimintXCFramework = ['Alamofire', 'Moya', 'Swinject', 'UnlimintSDK_Core', 'UnlimintSDK_UI']

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if unlimintXCFramework.include? "#{target}"
            target.build_configurations.each do |config|
                config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
            end
        end
    end
end
