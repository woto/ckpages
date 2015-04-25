$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ckpages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ckpages"
  s.version     = Ckpages::VERSION
  s.authors     = ["Ruslan Kornev"]
  s.email       = ["oganer@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Ckpages."
  s.description = "TODO: Description of Ckpages."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "ransack"
  s.add_dependency "simple_form"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "jquery-rails"
  s.add_dependency "turbolinks"
  s.add_dependency "simple_form"
  s.add_dependency "carrierwave"

  s.add_development_dependency "sqlite3"
end
