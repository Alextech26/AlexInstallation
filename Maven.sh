#!/bin/sh
# This script is a full guide on the installation of the Maven Software to any new linux EC2 instance created.
# Create a redhat server in aws with at least 4GB of RAM (Minimum requirement)
# Assume sudo rights
sudo hostname maven
cd /opt
# Java is a requirement for maven to build, because we mostly work on java file.
sudo yum install wget nano tree unzip git-all -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
java -version # know your java version
git --version # know your git version

#2. Install Maven.sh (running the script and its done in seconds)
#Step1) Download the Maven Software
sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.zip
sudo unzip apache-maven-3.8.5-bin.zip
sudo rm -rf apache-maven-3.8.5-bin.zip
sudo mv apache-maven-3.8.5/ maven
<<mm
Step3) Set Environmental Variable  -
For Specific User
  ec2-user
----------------------mvn
mm
# creating the MHD = maven home directory
#vi ~/.bash_profile
echo "export M2_HOME=/opt/maven" >>  ~/.bash_profile
echo "export PATH=$PATH:$M2_HOME/bin" >> ~/.bash_profile
<<m2
#Step3b) Set Environmental Variable  For All Users
----------------------cd 
echo "export M2_HOME=/opt/maven" >>  /etc/profile
echo "export PATH=$PATH:$M2_HOME/bin" >> /etc/profile
step4) Activate the maven home and mvn by running the below scripts
source /etc/profile
Step5) Check the Maven version
m2
source ~/.bash_profile
mvn -version #check the installed maven version
source ~/.bash_profile # refresh your maven with this command and even when its is not running