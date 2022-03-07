#! /bin/bash
# Programming and idea by : Mohammad Hossein Salehinezhad
# GitLab : https://github.com/mrunix1998/docker-registry.git
# Email : salehimohammad331@gmail.com
# Last update : Mon, 07 Mar 2022 13:56:34 +0330
# Docker-Registry v1.0.0 [Create_reg_user]
# ------------------------------------------------------------------------------------------------------------------------------------------ #

# Get username # ------------------------------------------------------------------------------------------ #
echo -en "\e[32m[>]Enter username :\e[39m" ; read username
# ------------------------------------------------------------------------------------------------------------------ #

# Install some packages # ------------------------------------------------------------------------------------------ #
apt-get install apache2-utils -y
[ "$?" != "0" ] && echo -e '\e[31m[>] We can not install apache2-utils\e[39m' && exit 1
apt-get clean
sleep 1
clear
# ------------------------------------------------------------------------------------------------------------------ #

# Create Username & Password for docker login # ------------------------------------------------------------------------ #
echo -en "\e[32mEnter password for user :\e[39m"
echo
htpasswd -c registry.password ${username}
cp -r registry.password /root/docker-registry/nginx/certs/
rm registry.password
# ---------------------------------------------------------------------------------------------------------------------- #
