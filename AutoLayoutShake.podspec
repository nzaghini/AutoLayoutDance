#
# Be sure to run `pod spec lint AutoLayoutShake.podspec' to ensure this is a
# valid spec.
#
# Remove all comments before submitting the spec. Optional attributes are commented.
#
# For details see: https://github.com/CocoaPods/CocoaPods/wiki/The-podspec-format
#
Pod::Spec.new do |s|
  s.name         = "AutoLayoutShake"
  s.homepage     = "https://github.com/nzaghini/AutoLayoutShake"
  s.version      = "0.0.1"
  s.summary      = "AutoLayoutShake is a small library to help the debug of autoLayout constraints."
  s.license      = { :type => "MIT", 
					 :text => <<-LICENSE
					 LICENSE
				   }
  s.author       = 'nzaghini'
  s.source       = { :git => "https://github.com/nzaghini/AutoLayoutShake.git", :tag => s.version.to_s}
  s.platform     = :ios, '6.0'
  s.source_files = 'Classes/NZAutoLayoutShake.{h,m}'
  s.public_header_files = 'Classes/NZAutoLayoutShake.h'
  s.framework	 = 'Foundation'
end
