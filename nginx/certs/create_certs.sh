#! /bin/bash
# Programming and idea by : Mohammad Hossein Salehinezhad
# GitLab : https://github.com/mrunix1998/docker-registry.git
# Email : salehimohammad331@gmail.com
# Last update : Mon, 07 Mar 2022 13:56:34 +0330
# Docker-Registry v1.0.0 [Certs]
# ------------------------------------------------------------------------------------------------------------------------------------------ #


# Create ca cert # ----------------------------------------------------------------------------------------------------- #
openssl genrsa -out CA.key 2048
openssl req -x509 -new -nodes -key CA.key -days 10000 -out CA.crt
# ---------------------------------------------------------------------------------------------------------------------- #


# Create csr for authenticate # ---------------------------------------------------------------------------------------- #
openssl genrsa -out domain.key 2048
openssl req -new -key domain.key -out registry.shetab.ir.csr
# ---------------------------------------------------------------------------------------------------------------------- #


# Validate certificate # ----------------------------------------------------------------------------------------------- #
openssl x509 -req -in registry.shetab.ir.csr -CA CA.crt -CAkey CA.key -CAcreateserial -out domain.crt -days 3650
# ---------------------------------------------------------------------------------------------------------------------- #


# Use ca cert in docker # ---------------------------------------------------------------------------------------------- #
echo -en "\033[0;31mUsing certificates in system\033[0m"
echo
mkdir /usr/local/share/ca-certificates/docker-cert
cp CA.crt /usr/local/share/ca-certificates/docker-cert
echo -en "\033[0;31mUpdate Ca certificate\033[0m"
echo
update-ca-certificates
sleep 2
# ---------------------------------------------------------------------------------------------------------------------- #

# Restart docker service # --------------------------------------------------------------------------------------------- #
echo -en "\033[0;36mRestart docker service\033[0m"
echo
service docker restart
sleep 1
# ---------------------------------------------------------------------------------------------------------------------- #

# Delete useless files # ----------------------------------------------------------------------------------------------- #
echo -en "\033[0;31mRemove useless files\033[0m"
echo
rm registry.shetab.ir.csr
sleep 1
# ---------------------------------------------------------------------------------------------------------------------- #


echo -en "\033[0;32mYou should use \033[0m \033[0;31m\033[1mCA.crt\033[0m \033[0;32min /usr/local/share/ca-certificates/docker-cert for docker client to push and pull images\033[0m"
echo