# -*- encoding: utf-8 -*-
# stub: line-bot-api 1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "line-bot-api"
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["LINE Corporation"]
  s.date = "2017-10-30"
  s.description = "Line::Bot::API - SDK of the LINE Messaging API for Ruby"
  s.email = ["hirohisa.kawasaki@gmail.com"]
  s.homepage = "https://github.com/line/line-bot-sdk-ruby"
  s.licenses = ["Apache-2.0"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.5.1"
  s.summary = "SDK of the LINE Messaging API"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 10.4"])
      s.add_development_dependency(%q<bundler>, ["~> 1.11"])
      s.add_development_dependency(%q<webmock>, ["~> 1.24"])
      s.add_development_dependency(%q<addressable>, ["~> 2.3"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
    else
      s.add_dependency(%q<rake>, ["~> 10.4"])
      s.add_dependency(%q<bundler>, ["~> 1.11"])
      s.add_dependency(%q<webmock>, ["~> 1.24"])
      s.add_dependency(%q<addressable>, ["~> 2.3"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 10.4"])
    s.add_dependency(%q<bundler>, ["~> 1.11"])
    s.add_dependency(%q<webmock>, ["~> 1.24"])
    s.add_dependency(%q<addressable>, ["~> 2.3"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
  end
end
