%w(cmake gcc).each do |required_package|
  package_resource = package required_package do
    action :nothing
  end
  package_resource.run_action(:install)
end

%w(openssl-devel libssh2-devel).each do |optional_package|
  package_resource = package optional_package do
    action :nothing
  end
  package_resource.run_action(:install)
end

chef_gem 'rugged' do
  compile_time true
end
chef_gem 'daun' do
  compile_time true
end

require 'daun'
require 'rugged'
