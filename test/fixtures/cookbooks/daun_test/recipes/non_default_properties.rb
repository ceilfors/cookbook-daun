include_recipe 'daun'

daun '/tmp/gq' do
  repository 'https://github.com/ceilfors/gq.git'
  config('daun.tag.limit' => 3,
         'daun.tag.blacklist' => 'mytag',
         'daun.branch.blacklist' => 'mybranch')
end
