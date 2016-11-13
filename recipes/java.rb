

case node[:platform_version]
	when "16.04", "16.10"
		jdk = "openjdk-8-jdk"
		jre = "openjdk-8-jre" 
	when "14.04", "14.10"

		jdk = "openjdk-7-jdk" 
		jre = "openjdk-7-jre"
end


package ["#{jre}", "#{jdk}"] do

action :install
end
