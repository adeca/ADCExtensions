Pod::Spec.new do |s|
  s.name         = "ADCExtensions"
  s.version      = "1.1.1"
  s.summary      = "ADCExtensions is a collection of useful categories for Cocoa objects."
  s.homepage     = "https://github.com/adeca/ADCExtensions"
  s.license      = { :type => 'MIT' }
  s.authors      = { "Agustin de Cabrera" => "agustindc@gmail.com" }
  s.source       = { :git => "https://github.com/adeca/ADCExtensions.git", :tag => s.version.to_s }
  s.source_files = 'ADCExtensions', 'ADCExtensions/**/*.{h,m}'
  s.requires_arc = true
  s.platform     = :ios, '6.1'
end