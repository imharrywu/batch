#!/bin/bash

sudo apt-get update -qy
sudo apt-get install -qy resolvconf
sudo systemctl enable resolvconf
sudo systemctl start resolvconf
sudo systemctl status resolvconf
sudo resolvconf --enable-updates

cat <<heredoc >>/etc/resolvconf.d/ressolvconf.d/head
nameserver 1.1.1.1
nameserver 8.8.8.8
heredoc

sudo resolvconf -u

sudo apt-get install -qy curl git jq gcc g++ nodejs make build-essential docker.io resolvconf

#wget https://golang.google.cn/dl/go1.16.5.linux-amd64.tar.gz
#tar zxvf ./go1.16.5.linux-amd64.tar.gz

export GOROOT=/root/go
export GOPATH=/root/gopath
export PATH=$GOROOT/bin:$PATH
export GOPROXY=https://goproxy.io,direct
