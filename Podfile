inhibit_all_warnings!
platform :ios, '13.0'
workspace 'Movies.xcworkspace'

def default_pods
    pod 'Moya', '15.0.0'
    pod 'Kingfisher', '7.1.2'
end

def tests_pods
    pod 'Quick', '4.0.0'
    pod 'Nimble', '9.2.1'
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
    
    target 'ServicesTests' do
        tests_pods
    end
end
