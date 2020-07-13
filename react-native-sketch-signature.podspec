require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-sketch-signature"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.author       = package["author"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.platform     = :ios, "8.4"
  s.source       = { :git => "https://github.com/LFMAKER/react-native-sketch-signature", :tag => "#{s.version}" }
  s.source_files  = "ios/*.{h,m}"
  s.dependency "React"
end
