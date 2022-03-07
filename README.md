<div align="center">
    <h3 align="center">Docker-Registry v1</h3>
</div>

# Order of running bash scripts
* registry
* nginx


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
