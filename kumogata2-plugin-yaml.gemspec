# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kumogata2/plugin/yaml/version'

Gem::Specification.new do |spec|
  spec.name          = "kumogata2-plugin-yaml"
  spec.version       = Kumogata2::Plugin::YAML::VERSION
  spec.authors       = ["Yoriki Yamaguchi"]
  spec.email         = ["email@y13i.com"]

  spec.summary       = %q{Kumogata2 YAML plugin.}
  spec.description   = %q{Kumogata2 YAML plugin.}
  spec.homepage      = "https://github.com/y13i/kumogata2-plugin-yaml"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "kumogata2"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
