property :destination, String, name_property: true
property :repository, String

default_action :update

action :update do
  daun = ::Daun::RuggedDaun.new(destination)
  unless ::File.foreach("#{destination}/.git/config").any?{ |l| l[repository] }
    converge_by("Initialize daun repository at #{destination}") do
      daun.init repository
    end
  end

  converge_by("Check out out daun repository at #{destination}") do
    puts
    daun.checkout
  end
end