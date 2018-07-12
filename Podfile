platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!

def shared_pods

# Appchance Pods
pod 'ios-extensions', :git => 'https://bitbucket.org/appchance/ios-extensions.git'
pod 'ios-extensions-rx', :git => 'https://bitbucket.org/appchance/ios-extensions-rx.git'

# Tools
pod 'SwiftLint'
pod 'SwiftGen'
pod 'Fabric'
pod 'Crashlytics'

# RX
pod 'RxSwift'
pod 'RxCocoa'

# Utilities
pod 'SwiftyBeaver'
pod 'Locksmith'
pod 'DBDebugToolkit', :configurations => ['Debug']
#pod 'Gloss'
#pod 'Timepiece'

# UI
pod 'Kingfisher'
#pod 'SnapKit'
#pod 'MXParallaxHeader'
#pod 'TPKeyboardAvoiding'
#pod 'UITextView+Placeholder'

end

target 'GitHubClient' do

shared_pods

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
            if config.name == 'Release'
                config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
                else
                config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
            end
        end
    end
end
