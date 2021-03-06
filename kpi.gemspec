# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{kpi}
  s.version = "0.5.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Artur Roszczyk"]
  s.date = %q{2011-05-15}
  s.description = %q{This gem helps you to track key indicators in your Rails app.}
  s.email = %q{artur.roszczyk@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "app/models/kpi/entry.rb",
    "app/models/kpi/merged_report.rb",
    "app/models/kpi/report.rb",
    "app/models/kpi/report/dynamic_definitions.rb",
    "app/models/kpi/report/suppress_memoization.rb",
    "lib/array/extract_options.rb",
    "lib/engine.rb",
    "lib/generators/kpi/USAGE",
    "lib/generators/kpi/kpi_generator.rb",
    "lib/kpi.rb",
    "lib/kpi/18compatibility.rb"
  ]
  s.homepage = %q{http://github.com/sevos/kpi}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Key Performance Indicators for Rails 3.x}
  s.test_files = [
    "test/test_helper.rb",
    "test/unit/kpi/entry_test.rb",
    "test/unit/kpi/merged_report_test.rb",
    "test/unit/kpi/report_test.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionmailer>, [">= 2.3"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<actionmailer>, [">= 2.3"])
      s.add_dependency(%q<activesupport>, [">= 2.3"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<actionmailer>, [">= 2.3"])
    s.add_dependency(%q<activesupport>, [">= 2.3"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

