<div align="center">
    <h1 align="center">Docker-Registry v1</h1>
</div>


![Visits Badge](https://badges.pufler.dev/visits/mrunix1998/docker-registry)
![GitHub last commit](https://img.shields.io/github/last-commit/mrunix1998/docker-registry)
[![GitHub issues](https://img.shields.io/github/issues/mrunix1998/docker-registry)](https://github.com/mrunix1998/docker-registry/issues)
[![GitHub stars](https://img.shields.io/github/stars/mrunix1998/docker-registry)](https://github.com/mrunix1998/docker-registry/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/mrunix1998/docker-registry)](https://github.com/mrunix1998/docker-registry/network)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)


<a href="https://www.linkedin.com/in/mrunix1998/" style="text-align:center">
  <img
    alt="Linkedin"
    src="https://img.shields.io/badge/linkedin-0077B5?logo=linkedin&logoColor=white&style=for-the-badge"
  />
</a>

# Docker-settings
For changing docker to use another path to save config and volumes follow the steps below:

## Stop docker

```bash
systemctl stop docker.service docker.socket
```

## Change settings

First create lib's for docker libraries

```bash
mkdir -p /mnt/docker/lib
```
Then edit docker service 

```bash
vim /lib/systemd/system/docker.service
```

```bash
ExecStart=/usr/bin/dockerd -g /mnt/docker/lib -H fd:// --containerd=/run/containerd/containerd.sock
```

## Restart docker

```bash
systemctl daemon-reload
systemctl start docker
```

## Cloning project

```bash
cd /root
git clone https://github.com/mrunix1998/docker-registry.git
```

## Quick Start

1 - Go to nginx folder :

```bash
cd /root/docker-registry/nginx/
```

- Go to certs file and run bash script to create needed certs for nginx and registry :

```bash
cd certs
bash create_certs.sh
```

**Note** : Write your domain name in both of common name when creating certs.

![](./images/1.png)
![](./images/2.png)
![](./images/3.png)


- Then got to the conf.d file and change registry.conf ==> (line 11, 12, 17)

- Finally, you can start up your nginx container:

```bash
bash setup.sh up
```

2 - Go to registry folder :

```bash
 cd /root/docker-registry/registry/
```

- Run create_reg_user.sh script file to create registry user :

```bash
bash create_reg_user.sh
```

- Finally, run start up script to run registry and registry ui container:

**Note** : Notice that on line 22 change registry admin password.

```bash
 bash setup.sh up
```

**On client** you should set below command in /etc/docker/daemon.json or update certificate to know your registry's CA.crt :

 
```bash
{
  "insecure-registries": [
    "registry.example.com:443"
  ]
}
```

```bash
systemctl daemon-reload
systemctl restart docker
```

or 

- ssh CA.crt from registry vm and then run :

```bash
mkdir /usr/local/share/ca-certificates/docker-cert
cp CA.crt /usr/local/share/ca-certificates/docker-cert
```

```bash
systemctl restart docker
```


### For **login** and **taging** and **push** and **pull** images in registry you should run following commands :


![login](https://github.githubassets.com/images/icons/emoji/unicode/1f510.png)
```bash
docker login registry.example.com:443
```

![Taging](https://github.githubassets.com/images/icons/emoji/unicode/1f4cc.png)
```bash
docker tag <someimage> registry.example.com:443/<someimage>:<tag>
```

![Pushing](https://github.githubassets.com/images/icons/emoji/unicode/1f4e5.png)
```bash
docker push registry.example.com:443/<someimage>:<tag>
```

![Pulling](https://github.githubassets.com/images/icons/emoji/unicode/1f4e4.png)
```bash
docker pull registry.example.com:443/<someimage>:<tag>
```
