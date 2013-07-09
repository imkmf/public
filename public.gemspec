# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'public/version'

Gem::Specification.new do |spec|
  spec.name          = "public"
  spec.version       = Public::VERSION
  spec.authors       = ["Kristian Freeman"]
  spec.email         = ["kristian@kristianfreeman.com"]
  spec.description   = %q{Dropbox public files made easy}
  spec.summary       = %q{Command-line tool for copying a file to your public Dropbox folder and then adding it to your clipboard}
  spec.homepage      = "https://github.com/imkmf/public"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables  << 'public'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "clipboard"
end
