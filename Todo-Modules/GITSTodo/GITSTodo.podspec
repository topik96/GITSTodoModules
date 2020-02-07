Pod::Spec.new do |s|
s.name         = "GITSTodo"
s.version      = "0.0.1"
s.summary      = "GITSTodo Module."
s.homepage     = "http://git.gits.id/RnD/swift-ios-framework"
s.license      = "MIT (ios)"
s.author             = { "GITS Indonesia" => "topikmujianto@gits.co.id" }
s.source       = { :git => "http://git.gits.id/RnD/swift-ios-framework.git", :tag => "#{s.version}" }
s.source_files  = "GITSTodo/Classes/**/*.{h,m,swift}"
s.resource_bundles = {'GITSTodo' => ['GITSTodo/Assets/**/*.{storyboard,xib,xcassets,json,imageset,png,plist}']}
s.resource = 'GITSTodo/Assets/**'
s.platform         = :ios, "13.2"
s.swift_version = '5.0'
end
