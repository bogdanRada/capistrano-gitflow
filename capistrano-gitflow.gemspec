# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

require File.expand_path("../lib/capistrano/gitflow/version", __FILE__)

Gem::Specification.new do |s|
  s.name = %q{capistrano-gitflow}
  s.version = CapistranoGitFlow.gem_version

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Nichols"]
  s.date =%q{2011-04-07}
  s.description = %q{Capistrano recipe for a deployment workflow based on git tags}
  s.email = %q{josh@technicalpickles.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = `git ls-files`.split("\n")

  s.homepage = %q{http://github.com/technicalpickles/capistrano-gitflow}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Capistrano recipe for a deployment workflow based on git tags}
  s.test_files =s.files.grep(/^(spec)/)

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 0"])
      s.add_runtime_dependency(%q<stringex>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 3.4.0"])
      s.add_development_dependency(%q<rspec-its>, [">= 1.2.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0.10"])
      s.add_development_dependency(%q<simplecov-summary>, [">= 0.0.4"])
      s.add_development_dependency(%q<mocha>, [">= 1.1"])
      s.add_development_dependency(%q<rake>, [">= 10.4"])
    else
      s.add_dependency(%q<capistrano>, [">= 0"])
      s.add_dependency(%q<stringex>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 3.4.0"])
      s.add_dependency(%q<rspec-its>, [">= 1.2.0"])
      s.add_dependency(%q<simplecov>, [">= 0.10"])
      s.add_dependency(%q<simplecov-summary>, [">= 0.0.4"])
      s.add_dependency(%q<mocha>, [">= 1.1"])
      s.add_dependency(%q<rake>, [">= 10.4"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 0"])
    s.add_dependency(%q<stringex>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 3.4.0"])
    s.add_dependency(%q<rspec-its>, [">= 1.2.0"])
    s.add_dependency(%q<simplecov>, [">= 0.10"])
    s.add_dependency(%q<simplecov-summary>, [">= 0.0.4"])
    s.add_dependency(%q<mocha>, [">= 1.1"])
    s.add_dependency(%q<rake>, [">= 10.4"])
  end
end
