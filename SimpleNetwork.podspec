Pod::Spec.new do |s|
  s.swift_version    = '5.0'
  s.name             = 'SimpleNetwork'
  s.version          = '0.1.0'
  s.summary          = 'SimpleNetwork'
  s.description      = <<-DESC
The POD SimpleNetwork is a network layer that takes care of all the communication that the user wants to do, in the simplest and most abstract way possible.
                       DESC

  s.homepage         = 'https://github.com/ericksilva-dev/SimpleNetwork.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'erickkaiquesilva' => 'erick.kaique.silva272@gmail.com' }
  s.source           = { :git => 'https://github.com/ericksilva-dev/SimpleNetwork.git', :tag => s.version.to_s }
  
  s.social_media_url = 'https://twitter.com/ErKaiqui'

  s.ios.deployment_target = '12.0'

  s.source_files = 'SimpleNetwork/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
