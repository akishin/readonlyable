# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "readonlyable"
  spec.version       = '0.0.1'
  spec.authors       = ["akishin"]
  spec.email         = ["akishin999@gmail.com"]
  spec.description   = %q{read-only model for ActiveRecord}
  spec.summary       = %q{read-only model for ActiveRecord}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "rspec"
end
