source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/cardpay/ios-sdk-podspec.git'

platform :ios, '13'
use_frameworks!

target 'UnlimintSDK-Demo' do

  pod 'UnlimintSDK_UI', '1.8.2'

end


post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
	            config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
		end
	end
end

