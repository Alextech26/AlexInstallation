<< Prerequisite
AWS Acccount.
Create Redhat EC2 t2.medium Instance with 4GB RAM.
Create Security Group and open Required ports.
8080 got Jenkins, ..etc
Attach Security Group to EC2 Instance.
Install java openJDK 1.8+ for SonarQube version 7.8
Install Java JDK 1.8+ as Jenkins pre-requisit
Install other softwares - git, unzip and wget
Prerequisite

hostname cicd
sudo yum -y install unzip wget tree git
sudo wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
sudo yum install jdk-8u131-linux-x64.rpm -y

# Add Jenkins Repository and key

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
cd /etc/yum.repos.d/
sudo curl -O https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Install Jenkins
sudo yum -y install jenkins  --nobest

# start Jenkins service and verify Jenkins is running
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins

# Access Jenkins from the browser
public-ip:8080

# get jenkins initial admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword