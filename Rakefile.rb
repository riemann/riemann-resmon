require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'
require 'find'

# Don't include resource forks in tarballs on Mac OS X.
ENV['COPY_EXTENDED_ATTRIBUTES_DISABLE'] = 'true'
ENV['COPYFILE_DISABLE'] = 'true'

# Gemspec
gemspec = Gem::Specification.new do |s|
  s.rubyforge_project = 'riemann-resmon'

  s.name = 'riemann-resmon'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.author = 'Gavin Sandie'
  s.email = 'beach@vicecity.co.uk'
  s.homepage = 'https://github.com/riemann/riemann-resmon'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Submits resmon stats to riemann.'

  s.add_dependency 'riemann-tools', '~> 0.2.18'
  s.add_dependency 'faraday', '>= 0.8.5'
  s.add_dependency 'nokogiri', '>= 1.5.6'

  s.files = FileList['bin/*', 'LICENSE', 'README.md'].to_a
  s.executables |= Dir.entries('bin/')
  s.has_rdoc = false

  s.required_ruby_version = '>= 2.0.0'
end

Gem::PackageTask.new gemspec do |p|
end
