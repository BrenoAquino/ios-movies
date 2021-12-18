inhibit_all_warnings!
platform :ios, '13.0'
workspace 'Movies.xcworkspace'

def default_pods
    pod 'Moya', '15.0.0'
    pod 'Kingfisher', '7.1.2'
end

target 'App' do
    project 'App/App.xcodeproj'
    use_frameworks!
    default_pods
end

target 'Services' do
    project 'Services/Services.xcodeproj'
    use_frameworks!
    default_pods
end