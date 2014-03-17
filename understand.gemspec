# CURRENT FILE :: team_page.gemspec
require File.expand_path("../lib/understand/version", __FILE__)

Gem::Specification.new do |s|
	s.name 						            = "understand"
  	s.version                   = Understand::VERSION
  	s.platform                  = Gem::Platform::RUBY
  	s.authors                   = [ "Salvatore Piazzolla" ]
  	s.email                     = [ "salvatorepiazzolla3@gmail.com" ]
  	s.homepage                  = ""
  	s.description               = "A simple Rails 3 engine gem that adds a team page to any Rails 3 application."
  	s.summary                   = "understand-#{s.version}"

  	s.rubyforge_project         = "understand"
  	s.required_rubygems_version = "> 1.3.6"

  	s.add_dependency "activesupport"
    s.add_dependency "rails"    
  	s.add_dependency "will_paginate", "~> 3.0"
    s.add_dependency "meta_search"

  	s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  	s.executables = s.files.map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  	s.require_path = 'lib'
end