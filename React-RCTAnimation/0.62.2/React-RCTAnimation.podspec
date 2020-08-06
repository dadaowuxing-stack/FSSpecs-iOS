version = '0.62.2'

source = { :git => 'https://github.com/facebook/react-native.git' }
if version == '1000.0.0'
  source[:commit] = `git rev-parse HEAD`.strip
else
  source[:tag] = "v#{version}"
end

Pod::Spec.new do |s|
  s.name                   = "React-RCTAnimation"
  s.version                = version
  s.summary                = "A native driver for the Animated API."
  s.homepage               = "http://facebook.github.io/react-native/"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
  s.source                 = source
  s.source_files           = "Libraries/NativeAnimation/{Drivers/*,Nodes/*,*}.{m}"
  s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
  s.header_dir             = "RCTAnimation"

  s.dependency "React-Core/RCTAnimationHeaders", version
end
