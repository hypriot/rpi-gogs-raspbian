#!/bin/bash
#

# regenerate ssh host keys

rm /etc/ssh/ssh_host_*
# SSH2 protocol
ssh-keygen -t dsa -N "" -f /etc/ssh/ssh_host_dsa_key
ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -t ecdsa -N "" -f /etc/ssh/ssh_host_ecdsa_key

# SSH1 protocol 
#ssh-keygen -f /etc/ssh/ssh_host_key -N '' -t rsa1

#ssh-keygen -A
/etc/init.d/ssh start

if ! test -d /data/gogs
then
	mkdir -p /var/run/sshd
	mkdir -p /data/gogs/data /data/gogs/conf /data/gogs/log /data/git
fi

test -d /data/gogs/templates || cp -ar ./templates /data/gogs/

ln -sf /data/gogs/log ./log
ln -sf /data/gogs/data ./data
ln -sf /data/git /home/git/gogs-repositories

rsync -rtv /data/gogs/templates/ ./templates/

if ! test -d ~git/.ssh
then
  mkdir ~git/.ssh
  chmod 700 ~git/.ssh
fi

if ! test -f ~git/.ssh/environment
then
  echo "GOGS_CUSTOM=/data/gogs" > ~git/.ssh/environment
  chown git:git ~git/.ssh/environment
  chown 600 ~git/.ssh/environment
fi

chown -R git:git /data .
chown -R git:git ~git/.ssh

netstat -tlpen
ps

exec su git -c "./gogs web"

