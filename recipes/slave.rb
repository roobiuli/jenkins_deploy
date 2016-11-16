#Adding user which will be used for connecting with swarm
user "jenkins" do
 comment "Jenkins user for slave conf"
 home '/home/jenkins'
 shell '/bin/bash'
 password 'samplepass'
	
end

#Sudo rules
execute "sudo_rule" do
command 'echo "jenkins ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/jenkins-slave ; echo "Defaults   !requiretty" | tee --append /etc/sudoers.d/jenkins-slave ; chmod 0440 /etc/sudoers.d/jenkins-slave'
end


# Execute the swarm plugin download 

execute "swarm" do
	command 'runuser -u jenkins -c curl -o /home/jenkins/swarm-client/2.2/swarm-client-2.2-jar-with-dependencies.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/2.2/swarm-client-2.2-jar-with-dependencies.jar'

	end


# Bootstrap / add the slave to the master

execute "Bootstrap" do
	command 'runuser -u jenkins -c /usr/bin/java -jar /home/jenkins/swarm-client-2.1-jar-with-dependencies.jar -fsroot /home/jenkins -master http://192.168.0.150:8080 -executors 1 -username jenkins -password samplepass -name slave $> /home/jenkins/swarm.log' 

end
