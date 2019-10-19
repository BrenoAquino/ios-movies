inhibit_all_warnings!
version = '13.0'
use_frameworks!
workspace 'Movies'

def default_pods
  pod 'Kingfisher', '= 5.4.0'
end

def network_pods
  pod 'Moya', '= 13.0.0'
end

def test_pods
  pod 'Quick', '= 2.1.0'
  pod 'Nimble', '= 8.0.1'
end

target 'App' do
  platform :ios, version
  project 'App/App.xcodeproj'
  default_pods
  network_pods
end

target 'Services' do
  platform :ios, version
  use_frameworks!
  project 'Services/Services.xcodeproj'
  network_pods
end
