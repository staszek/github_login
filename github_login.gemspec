# -*- encoding: utf-8 -*-
require File.expand_path('../lib/github_login/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Stanisław Kolarzowski"]
  gem.email         = ["stanislaw.kolarzowski@gmail.com"]
  gem.description   = %q{Console app that allows you to login into github using login and password. It stores token at disk, so it can be used by another apps.}
  gem.summary       = %q{Tool for logging in into github}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "github_login"
  gem.require_paths = ["lib"]
  gem.version       = GithubLogin::VERSION
end
