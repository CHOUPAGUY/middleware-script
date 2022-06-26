#!/bin/bash

#Created by Guy Landry
#Date: June 2022


#Docker installation on a Centos 7 server

#Docker is a containerization software used to create and manage containers. To use docker containers, you must first of all install Docker on your system. 

#First boot up a Centos 7 server and connect remotely to it. 

#                         INSTALLATION STEPS

#                       Clean up the system
#Make sure the system is clean by removing any old version of docker that might be installed: 

#it’s ok if yum reports that none of these packages are installed
echo "Welcome to Docker installation. Please wait ...."
sleep 2

sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

#                        Setup the docker repository
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
if [ $? -ne 0 ]
then
echo "Setup docker repository failed. Please read the error message."
exit 1
fi
#                        Install the docker engine
sudo yum install docker-ce docker-ce-cli containerd.io
if [ $? -ne 0 ]
then
echo "Docker installation failed. Please read the error message."
exit 2
fi
#                         Check the status, start and enable docker daemon
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
if [ $? -ne 0 ]
then
echo "Docker status check failed. Please read the error message."
exit 3
fi
sleep 3
echo "echo "Congratulations! Docker has been installed successfully. You can start running docker commands"
sleep 2
clear
