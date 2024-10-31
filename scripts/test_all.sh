#!/usr/bin/env bash

# Get the directory of the current script
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Function to run a command and show progress
run_command() {
    local cmd="$1"
    local name="$2"

    echo "Testing on $name..."

    # Execute the command; output will be redirected to /dev/null
    ($cmd) &> /dev/null

    # Capture the exit status
    local status=$?

    # Print the result
    if [ $status -eq 0 ]; then
        echo "Testing on $name: OK"
    else
        echo "Testing on $name: FALSE($status)"
    fi
}

# Commands to run
commands=(
    "$SCRIPT_DIR/test_image.sh archlinux_latest" "ArchLinux"
    "$SCRIPT_DIR/test_image.sh fedora_40" "Fedora 40"
    "$SCRIPT_DIR/test_image.sh fedora_41" "Fedora 41"
    "$SCRIPT_DIR/test_image.sh ubuntu_24.04" "Ubuntu 24.04"
    "$SCRIPT_DIR/test_image.sh ubuntu_24.10" "Ubuntu 24.10"
)

# Start running commands in parallel
for ((i=0; i<${#commands[@]}; i+=2)); do
    run_command "${commands[i]}" "${commands[i+1]}" &
done

# Wait for all background jobs to finish
wait
