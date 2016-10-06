name 'daun'
maintainer 'Wisen Tanasa'
maintainer_email 'wisen@ceilfors.com'
license 'Apache 2.0'
description 'Provides daun installation and resources'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'
issues_url 'https://github.com/ceilfors/cookbook-daun/issues'
source_url 'https://github.com/ceilfors/cookbook-daun'

%w(redhat centos).each do |os|
  supports os
end

chef_version '>= 12.5'
