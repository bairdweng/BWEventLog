#
# Be sure to run `pod lib lint BWEventLog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BWEventLog'
  s.version          = '1.0'
  s.summary          = 'A short description of BWEventLog.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/bairdweng/BWEventLog'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bairdweng' => '644672334@qq.com' }
  s.source           = { :git => 'https://github.com/bairdweng/BWEventLog.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.source_files = 'BWEventLog/Classes/**/*'
  s.dependency 'Alamofire'
  s.dependency 'AsyncSwift'
  s.dependency 'CryptoSwift'
end
