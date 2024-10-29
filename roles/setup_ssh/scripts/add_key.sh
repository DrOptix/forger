#!/usr/bin/env bash

key_path=$1
key_name=$(basename $key_path)
pass=$(cat "$FORGER_SECRETS_DIR/$key_name.txt")

/usr/bin/expect <<EOF
    set timeout -1
    spawn ssh-add "$key_path"
    expect "Enter passphrase for $key_path:"
    send "$pass\r"
    expect eof
EOF
