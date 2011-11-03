# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Linus Oleander"]
  gem.email         = ["linus@oleander.nu"]
  gem.description   = %q{A secure Faye server}
  gem.summary       = %q{A secure Faye server}
  gem.homepage      = "https://github.com/oleander/secure_faye"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "secure_faye"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"
end
