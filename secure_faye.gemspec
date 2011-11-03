# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Linus Oleander"]
  gem.email         = ["linus@oleander.nu"]
  gem.description   = %q{A secure Faye server and client}
  gem.summary       = %q{A secure Faye server and client}
  gem.homepage      = "https://github.com/oleander/secure_faye"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "secure_faye"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"
  
  gem.add_dependency("rest-client")
  gem.add_dependency("faye")
  gem.add_dependency("acts_as_chain")
  gem.add_dependency("jsonify")
  
  gem.add_development_dependency("rspec")
  
  s.required_ruby_version = "~> 1.9.0"
end
