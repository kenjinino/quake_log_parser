# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quake_log_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "quake_log_parser"
  spec.version       = QuakeLogParser::VERSION
  spec.authors       = ["Edson Ninomiya"]
  spec.email         = ["kenjinino07@gmail.com"]
  spec.description   = %q{A Quake log parser}
  spec.summary       = %q{A Quake log parser}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.0'
  spec.executables << 'quakelogparser'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
