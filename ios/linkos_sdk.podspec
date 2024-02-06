#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint linkos_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'linkos_sdk'
  s.version          = '0.0.1'
  s.summary          = 'LinkOS SDK wrapper'
  s.description      = <<-DESC
LinkOS SDK wrapper for flutter/dart projects.
                       DESC
  s.homepage         = 'https://techdocs.zebra.com/link-os/2-13/ios/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'
  s.public_header_files = 'Classes/**/*.h'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES', 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64', 
    'ENABLE_BITCODE' => 'NO',
    'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64'
  }
  s.swift_version = '5.0'
  s.vendored_libraries = 'Libs/LinkOS/libZSDK_API.a'
  s.static_framework = true
end
