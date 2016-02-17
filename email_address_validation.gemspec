# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'email_address_validation/version'

Gem::Specification.new do |spec|

  spec.name = "emailvalidation"
  spec.version = MailboxLayer::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Peter Andreas Moelgaard"]
  spec.email = ["github@petermolgaard.com"]
  spec.homepage = "https://github.com/pmoelgaard/email_address_validation"

  spec.description = "Ruby Library for the mailboxlayer API, a web service that email validation & verification, https://mailboxlayer.com/"
  spec.summary = "Simple and powerful email verification JSON API using SMTP, typo checks, syntax validation, and free and disposable provider filtering. Free for personal use."

  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_runtime_dependency "httparty"
  spec.add_runtime_dependency "hashable"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "bump"

end