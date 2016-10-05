require 'serverspec'
require 'rugged'

if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
  set :backend, :exec
else
  set :backend, :cmd
  set :os, family: 'windows'
end

base_path = File.dirname(__FILE__)
Dir["#{base_path}/*_examples.rb"].each do |shared_example|
  require_relative shared_example
end
Dir["#{base_path}/support/**/*.rb"].each do |servserspec_support|
  require_relative servserspec_support
end
