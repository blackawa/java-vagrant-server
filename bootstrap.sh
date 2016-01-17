#!/bin/sh

# =====================================================
# Vagrant Server for Java App
# This Script is For All Servers in This Vagrant Directory
# =====================================================

# start provisioning!
echo
echo "========================================================================"
echo "Starting Provisioning!"
echo "This may take minutes. 3 to 5 minutes or longer."
echo "========================================================================"
echo

# yum
yum upgrade -y
yum install -y git vim wget nc.x86_64 tree.x86_64

# add group / user
# Delete '#' to Cancel Comment Out.
#
# groupadd group01
# useradd -g group01 user01
# echo pass01 | passwd --stdin user01

# user to login
# Create Relations for Java, Maven...and so on
# to This User.
# Select the User You Are Using in This Machine.
USER=user01

# jdk install
DOWNLOADS_DIR=/vagrant/Downloads
RPM_FILE_NAME=jdk-8u65-linux-x64.rpm 
mkdir -p ${DOWNLOADS_DIR}
wget --no-check-certificate --no-cookie --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.rpm -O ${DOWNLOADS_DIR}/${RPM_FILE_NAME}
sudo rpm -ivh ${DOWNLOADS_DIR}/${RPM_FILE_NAME}
echo "export JAVA_HOME=/usr/java/jdk1.8.0_65" >> /home/${USER}/.bash_profile

# maven install
MAVEN_VERSION=apache-maven-3.3.9
MAVEN_FILE_NAME=${MAVEN_VERSION}-bin.tar.gz
wget http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -O ${DOWNLOADS_DIR}/${MAVEN_FILE_NAME}
tar xzvf ${DOWNLOADS_DIR}/${MAVEN_FILE_NAME} -C /opt
echo "M3_HOME=/opt/${MAVEN_VERSION}" >> /home/${USER}/.bash_profile
echo "export M3_HOME" >> ~/.bash_profile
echo "export PATH=\${M3_HOME}/bin:\${PATH}" >> /home/${USER}/.bash_profile

# x-window install
yum groupinstall -y "Desktop" "Desktop Platform" "General Purpose Desktop"

# stop iptables
###################### ONLY IN DEVELOPMENT ENVIRONMENT ###########################
/etc/rc.d/init.d/iptables stop
chkconfig iptables off


