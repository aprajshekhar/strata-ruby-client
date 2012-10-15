#!/usr/bin/env gem build
# encoding: utf-8

require "base64"

Gem::Specification.new do |s|
  s.name = "strata-ruby-client"
  s.version = "0.1"
  s.authors = ["A.P.Rajshekhar"]
  s.homepage = "http://github.com/aprajshekhar"
  s.summary = "Access Strata using Ruby"
  s.description = "#{s.summary}. A Ruby client for Strata API."
  s.email = "randalap@redhat.com"
  
  # files
  s.files = `git ls-files`.split("\n")  
  s.require_paths = ["lib"]

  # Ruby version
  #s.required_ruby_version = ::Gem::Requirement.new("~> 1.9")

  # dependencies
  # RubyGems has runtime dependencies (add_dependency) and
  # development dependencies (add_development_dependency)
  s.add_dependency('soap4r-ruby1.9')
  s.add_dependency('connection_pool','>=0.9.2')
  s.add_dependency('rest-client','>=1.6.7')
  s.add_dependency('logging','>=1.7.2')

#  begin
#    require "changelog"
#  rescue LoadError
#    warn "You have to have changelog gem installed for post install message"
#  else
#    s.post_install_message = CHANGELOG.new.version_changes
#  end
  
end