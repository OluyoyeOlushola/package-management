#!/bin/bash
# TOMCAT.SH
# Steps for Installing tomcat9 on rhel7&8
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
# https://github.com/LandmakTechnology/package-management/tree/main/Tomcat-installation
sudo hostnamectl set-hostname tomcat
cd /opt 
sudo yum install git wget -y
sudo yum install java-1.8.0-openjdk-devel -y
# Download tomcat software and extract it.
# dowanload and extract tomcat software
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz
sudo tar -xvf apache-tomcat-9.0.73.tar.gz
sudo rm apache-tomcat-9.0.73.tar.gz
sudo chmod 777 -R /opt/tomcat9
sudo sh /opt/tomcat9/bin/startup.sh
# create a soft link to start and stop tomcat from anywhere 
# This will enable you to manage tomcat as a service
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo starttomcat
echo "end on tomcat installation"
#========

#2. Start of tomcat configuration 

#Tomcat server configuration:
find / -name server.xml context.xml
vim /opt/tomcat9/conf/server.xml

vi /opt/tomcat9/webapps/manager/META-INF/context.xml
#add comment tags (<!--  -->) just as below
 <!--
  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
          allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
          -->

vi /opt/tomcat9/conf/tomcat-users.xml  # to add user
# copy and edit usernames, password and roles as required for user and paste just before the last closing tag.
<user username="olushola" password="<must-be-changed>" roles="role1"/>

#you can then acces the broswer with serverIP:8080

	
  
  
	
	
	
