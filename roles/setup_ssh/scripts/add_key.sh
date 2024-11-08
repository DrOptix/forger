#!/usr/bin/env bash

key_pass=$1
key_path=$2
key_name=$(basename $key_path)

/usr/bin/expect <<EOF
    set timeout -1
    spawn ssh-add "$key_path"
    expect "Enter passphrase for $key_path:"
    send "$key_pass\r"
    expect eof
EOF
