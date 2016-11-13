execute "update" do
	case node[:platform]
	when 'ubuntu', 'debian'
	command 'apt-get update'
	end
end


package "wget" do

action :install

end

