source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

target 'Monumap' do

    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'Moya/RxSwift'
    pod 'SwiftyJSON'

    target 'MonumapTests' do
        inherit! :search_paths

        pod 'Quick'
        pod 'Nimble'
        pod 'Nimble-Snapshots/DynamicSize'

    end
end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            # Disable Code Coverage for Pods projects
            config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
        end
    end
end
