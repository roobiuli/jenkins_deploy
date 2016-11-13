 

execute "update" do
	command "wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add - ; sudo /bin/echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list ; sudo apt-get update"

end


package "jenkins" do
action :install
end 


