 platform :ios, '10.0'

target 'baseproject' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for baseproject

    pod 'NVActivityIndicatorView'
    pod 'MBProgressHUD'
    pod 'ObjectMapper'
    pod 'FontAwesome.swift'
    pod 'Alamofire' 
    pod 'AlamofireObjectMapper'
    pod 'GRMustache.swift4'  , '~> 3.0'
    pod 'Eureka'
    pod 'iCarousel'
    pod 'PromiseKit/Alamofire' , '~> 4.0'
    pod 'Presentr'
    pod 'Toaster'
    pod 'MXParallaxHeader'
    pod 'Material' 
    pod 'AKMaskField'
    pod 'MiawKit'
    pod 'SwiftyUserDefaults'
    pod 'Kingfisher'
    pod 'AlignedCollectionViewFlowLayout'
    pod 'SnapKit'
    pod 'INSPhotoGallery'
    pod 'PKHUD'
    pod 'SwiftLocation'
    pod 'SCLAlertView'
    pod 'Firebase/Core'
    pod 'Firebase/Messaging'
    pod 'AwesomeCache'
    pod "StompClientLib"
    pod "SkeletonView"
    pod 'SideMenu'
    pod 'ImagePicker'
    pod 'BulletinBoard'
    pod 'NotificationBannerSwift'
    pod 'Localize-Swift', '~> 2.0'
    pod 'RAMAnimatedTabBarController'
    pod 'SKCountryPicker'
    pod 'KeyboardAvoidingView', '~> 4.0'

	def testing_pods
    		pod 'Quick'
   		pod 'Nimble'
	end

	target 'UnitTests' do
    		testing_pods
	end

	target 'UITests' do
    		testing_pods
	end


end

 # select libraries who have different swift version

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['ImagePicker', 'Toaster', 'ObjectMapper', 'Alamofire', 'AlamofireObjectMapper', 'GRMustache.swift4', 'PromiseKit/Alamofire'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4'
      end
    end
  end
end



