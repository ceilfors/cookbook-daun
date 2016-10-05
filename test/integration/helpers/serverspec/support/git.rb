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
