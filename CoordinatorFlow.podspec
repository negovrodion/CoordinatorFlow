#
#  Be sure to run `pod spec lint CoordinatorFlow.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = 'CoordinatorFlow'
  s.version      = '0.1.0'
  s.summary      = 'Pod to simplify usage of coordinator navigation pattern.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description  = <<-DESC
  Pod to simplify usage of coordinator navigation pattern. Look CoordinatorFlowTestProject for example how to use.
                   DESC

  s.homepage     = "https://github.com/negovrodion/CoordinatorFlow"

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'negovrodion' => 'negovrodion@gmail.com' }
  s.source           = { :git => 'https://github.com/negovrodion/CoordinatorFlow.git', :tag => s.version.to_s }


  s.ios.deployment_target = "10.0"

  s.swift_version = "4.0"

  s.source_files  = 'CoordinatorFlow/**/*'

  # s.resource_bundles = {
  #   'CoordinatorFlow' => ['CoordinatorFlow/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

end
