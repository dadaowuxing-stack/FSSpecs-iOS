version = '0.62.2'

source = { :git => 'https://github.com/facebook/react-native.git' }
if version == '1000.0.0'
  source[:commit] = `git rev-parse HEAD`.strip
else
  source[:tag] = "v#{version}"
end

Pod::Spec.new do |s|
  s.name                   = "React-RCTBlob"
  s.version                = version
  s.summary                = "An API for displaying iOS action sheets and share sheets."
  s.homepage               = "http://facebook.github.io/react-native/"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
  s.source                 = source
  # RCTBlobCollector.h is not included in the React module as it has C++ code
  s.source_files           = "Libraries/Blob/*.{m,mm}", "Libraries/Blob/RCTBlobCollector.h"
  s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
  s.header_dir             = "RCTBlob"

  s.dependency "React-Core/RCTBlobHeaders", version
  s.dependency "React-Core/RCTWebSocket", version
  s.dependency "React-RCTNetwork", version
  s.dependency "React-jsi", version
end
