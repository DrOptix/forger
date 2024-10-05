#!/bin/bash

# Define colors for output
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # No Color

# Get the directory of the current script
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Directory containing Dockerfiles, relative to the script directory
DOCKERFILES_DIR="$SCRIPT_DIR/../dockerfiles"

# Check for the verbose flag
VERBOSE=false
if [[ "$1" == "-v" ]]; then
    VERBOSE=true
fi

# Function to show a spinner
show_spinner() {
    local pid=$1
    local delay=0.1
    local spinstr="|/-\\"
    local msg=$2
    printf "%s" "$msg"
    while kill -0 "$pid" 2>/dev/null; do
        for (( i=0; i<${#spinstr}; i++ )); do
            printf "\r%s [%c] " "$msg" "${spinstr:$i:1}"
            sleep "$delay"
        done
    done
    printf "\r%s    " "$msg" # Clear spinner
}

# Iterate over each Dockerfile in the dockerfiles directory
for dockerfile in "$DOCKERFILES_DIR"/*; do
    # Extract the base name of the Dockerfile to use as the image tag
    image_tag=$(basename "$dockerfile" | sed "s/Dockerfile.//")

    # Message to display while building
    msg="Building image forger_test:${image_tag}:"

    # Build the image using Podman
    if $VERBOSE; then
        podman build -t "forger_test:${image_tag}" -f "$dockerfile" "$DOCKERFILES_DIR/.."
        build_status=$?
    else
        podman build -t "forger_test:${image_tag}" -f "$dockerfile" "$DOCKERFILES_DIR/.." > /dev/null 2>&1 &
        pid=$!
        show_spinner "$pid" "$msg"
        wait "$pid"
        build_status=$?
    fi

    # Check the result of the build command
    if [[ $build_status -eq 0 ]]; then
        echo -e "\r${msg} ${GREEN}OK${NC}"
    else
        echo -e "\r${msg} ${RED}FAIL${NC}"
    fi
done
