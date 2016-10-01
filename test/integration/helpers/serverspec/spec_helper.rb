require 'serverspec'
require 'rugged'

if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
  set :backend, :exec
else
  set :backend, :cmd
  set :os, family: 'windows'
end

base_path = File.dirname(__FILE__)
Dir["#{base_path}/*_examples.rb"].each do |ex|
  require_relative ex
end

module Serverspec::Helper
  module Type
    def git(location)
      Serverspec::Type::Git.new(location)
    end
  end
end

module Serverspec::Type
  class Git < Base
    def exists?
      ::File.exist? @name
    end

    def initialized?
      ::File.exist? "#{@name}/.git"
    end

    def config
      Rugged::Repository.init_at(@name).config.to_hash
    end
  end
end
