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
  s.summary      = "AutoLayoutShake is a small library for debugging AutoLayout ambiguous layouts."
  s.license      = { :type => "MIT", 
					 :text => <<-LICENSE
					 LICENSE
				   }
  s.author       = { "Nicola Zaghini" => "nzaghini@gmail.com" }
  s.source       = { :git => "https://github.com/nzaghini/AutoLayoutShake.git", :tag => "0.0.1"}
  s.platform     = :ios, '5.0'
  s.source_files = 'Classes/*.{h,m}'
  s.public_header_files = 'Classes/*.h'
  s.requires_arc = true
end
