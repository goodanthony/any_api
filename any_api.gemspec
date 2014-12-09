# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'any_api/version'

Gem::Specification.new do |spec|
  spec.name          = "any_api"
  spec.version       = AnyApi::VERSION
  spec.authors       = ["anthony"]
  spec.email         = ["anthony@iamfree.com"]
  spec.summary       = %q{Access any API you like}
  spec.description   = %q{This is probably the world smallest API client. Give the infomation any API asking for you to access it. Then fill the blanks and you are good to go}
  spec.homepage      = "https://github.com/iamfree-com/any_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
