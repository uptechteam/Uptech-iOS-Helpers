Pod::Spec.new do |s|
	s.name             = 'Uptech_iOS_Helpers'
	s.version          = '1.0.0'
	s.summary          = 'iOS helper library that contains commonly used code in Uptech iOS projects.'
	s.homepage         = 'https://github.com/uptechteam/Uptech-iOS-Helpers'
	s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
	s.author           = { 'Sergey Kletsov' => 'sergey.kletsov@uptech.team' }
	s.source           = { :git => 'https://github.com/uptechteam/Uptech-iOS-Helpers.git', :tag => s.version.to_s }
	s.ios.deployment_target = '11.0'
	s.swift_version = '5.5'
	s.source_files = 'Sources/Uptech iOS Helpers/**/*'
end
