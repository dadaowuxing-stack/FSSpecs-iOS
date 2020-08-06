version = '0.62.2'

source = { :git => 'https://github.com/facebook/react-native.git' }
if version == '1000.0.0'
  source[:commit] = `git rev-parse HEAD`.strip
else
  source[:tag] = "v#{version}"
end

Pod::Spec.new do |s|
  s.name                   = "React-RCTNetwork"
  s.version                = version
  s.summary                = "The networking library of React Native."
  s.homepage               = "http://facebook.github.io/react-native/"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
  s.source                 = source
  s.source_files           = "Libraries/Network/*.{m,mm}"
  s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
  s.header_dir             = "RCTNetwork"

  s.dependency "React-Core/RCTNetworkHeaders", version
end
