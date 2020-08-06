version = '0.62.2'

source = { :git => 'https://github.com/facebook/react-native.git' }
if version == '1000.0.0'
  source[:commit] = `git rev-parse HEAD`.strip
else
  source[:tag] = "v#{version}"
end

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2018.10.22.00'
boost_compiler_flags = '-Wno-documentation'

Pod::Spec.new do |s|
  s.name                   = "ReactCommon"
  s.module_name            = "ReactCommon"
  s.version                = version
  s.summary                = "-"  # TODO
  s.homepage               = "http://facebook.github.io/react-native/"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
  s.source                 = source
  s.header_dir             = "ReactCommon" # Use global header_dir for all subspecs for use_frameworks! compatibility
  s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/DoubleConversion\" \"$(PODS_ROOT)/Headers/Private/React-Core\"",
                               "USE_HEADERMAP" => "YES",
                               "CLANG_CXX_LANGUAGE_STANDARD" => "c++14" }

  s.subspec "callinvoker" do |ss|
    ss.source_files = "ReactCommon/callinvoker/**/*.{cpp,h}"

    ss.dependency "React-cxxreact", version
    ss.dependency "DoubleConversion"
    ss.dependency "Folly", folly_version
    ss.dependency "glog"
  end

  s.subspec "turbomodule" do |ss|
    ss.dependency "ReactCommon/callinvoker", version
    ss.dependency "React-Core", version
    ss.dependency "React-cxxreact", version
    ss.dependency "React-jsi", version
    ss.dependency "Folly", folly_version
    ss.dependency "DoubleConversion"
    ss.dependency "glog"

    ss.subspec "core" do |sss|
      sss.source_files = "ReactCommon/turbomodule/core/*.{cpp,h}",
                         "ReactCommon/turbomodule/core/platform/ios/*.{mm,cpp,h}"
    end

    ss.subspec "samples" do |sss|
      sss.source_files = "ReactCommon/turbomodule/samples/*.{cpp,h}",
                         "ReactCommon/turbomodule/samples/platform/ios/*.{mm,cpp,h}"
      sss.dependency "ReactCommon/turbomodule/core", version
    end
  end
end
