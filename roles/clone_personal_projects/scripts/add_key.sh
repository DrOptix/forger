#!/bin/bash

key_path="/home/$USER/.ssh/github_droptix_ssh_ed25519"
pass=$(cat "/etc/forger/secrets/github_droptix_ssh_ed25519.txt")

# Run the expect script
/usr/bin/expect <<EOF
set timeout -1
spawn ssh-add $key_path
expect "Enter passphrase for $key_path:"
send "$pass\r"
expect eof
EOF
