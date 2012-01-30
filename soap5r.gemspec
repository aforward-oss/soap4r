require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib', 'soap', 'version')

SPEC = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'soap5r'
  s.version = SOAP::VERSION::STRING # + (ENV['PKG_BUILD'] ? ".#{ENV['PKG_BUILD']}" : ".#{Time.now.strftime('%Y%m%d%H%M%S')}")
  s.summary = "An updated implementation of SOAP 1.1 for Ruby 1.8 and 1.9."
  s.description = "An updated implementation of SOAP 1.1 for Ruby 1.8 and 1.9."

  s.authors     = ["Andrew Forward","Laurence A. Lee","Hiroshi NAKAMURA"]
  s.email       = ["andrew.forward@cenx.com", "rubyjedi@gmail.com", "nahi@ruby-lang.org"]
  s.homepage    = "https://github.com/aforward/soap4r/wiki"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.executables   = [ 'wsdl2ruby.rb', 'xsd2ruby.rb' ]
  s.require_paths = ["lib"]
  s.has_rdoc = false # disable rdoc generation until we've got more
  s.requirements << 'none'


  s.add_dependency("httpclient", "~> 2.1.5.2")

  s.add_development_dependency('rspec')
  s.add_development_dependency('autotest')
  s.add_development_dependency('autotest-fsevent') if RUBY_PLATFORM =~ /darwin/i
  s.add_development_dependency('rb-fsevent') if RUBY_PLATFORM =~ /darwin/i
end