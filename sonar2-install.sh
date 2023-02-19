#!/bin/bash

#Author: Guy Landry
#Date: 02/19/2023
#Description: Script to install sonarqube on CentOS7

# Become user vagrant
su - vagrant -p vagrant

echo "We are installing Sonarqube on CentOS7"

#Java 11 installation
sudo yum update -y

sudo yum install java-11-openjdk-devel -y

sudo yum install java-11-openjdk -y
#Download SonarQube latest versions on your server
sleep 2

cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
#Extract packages
sudo yum install unzip -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip
#Change ownership to the user and Switch to Linux binaries directory to start service
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
# start Sonarqube
sleep 10
cd /opt/sonarqube-9.3.0.51899/linux-x86-64
./sonar.sh start

# Get IP address
ip a
sleep: 30

