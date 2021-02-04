# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/cardpay/ios-sdk-podspec.git'

use_frameworks!

target 'UnlimintSDK-Demo' do

  pod 'UnlimintSDK', '~> 99.1'

end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
end
end
end
