#!/bin/bash

if [[ -z "$NEW_USER" ]]; then
    echo "NEW_USER must be set" 1>&2
    exit 1
fi

adduser $NEW_USER
usermod -aG sudo $NEW_USER

sed -i s/NEW_USER/$NEW_USER/g .zshrc

cat ~/.ssh/authorized_keys >> /home/$NEW_USER/.ssh/authorized_keys

cp banner.txt /etc/ssh/sshd_banner
sed -i "s/\#Banner none/Banner \/etc\/ssh\/sshd_banner/g" /etc/ssh/sshd_config