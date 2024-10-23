#!/bin/bash

key_name=$1
key_path="/home/$USER/.ssh/$key_name"
pass=$(cat "/etc/forger/secrets/$key_name.txt")

# Run the expect script
/usr/bin/expect <<EOF
set timeout -1
spawn ssh-add $key_path
expect "Enter passphrase for $key_path:"
send "$pass\r"
expect eof
EOF
