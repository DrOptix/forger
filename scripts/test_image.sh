#!/bin/bash

# Define colors for output
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # No Color

# Get the directory of the current script
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Directory containing Dockerfiles, relative to the script directory
DOCKERFILES_DIR="$SCRIPT_DIR/../dockerfiles"

# Collect OS types from Dockerfile extensions
OS_TYPES=()
for dockerfile in "$DOCKERFILES_DIR"/*; do
    os_type=$(basename "$dockerfile" | sed "s/Dockerfile\.//")
    OS_TYPES+=("$os_type")
done

# Check if the first argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <os_type>"
    echo "Available OS types:"
    for os_type in "${OS_TYPES[@]}"; do
        echo " - $os_type"
    done
    exit 1
fi

# Check if the provided OS type is valid
VALID_OS=false
for os_type in "${OS_TYPES[@]}"; do
    if [ "$1" == "$os_type" ]; then
        VALID_OS=true
        break
    fi
done

IMAGE_TAG="$1"

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

# If the OS type is valid, build and run the image using Podman
if $VALID_OS; then
    dockerfile="$DOCKERFILES_DIR/Dockerfile.$IMAGE_TAG"
    
    # Message to display while building
    msg="Building image forger_test:${IMAGE_TAG}:"

    podman build -t "forger_test:$IMAGE_TAG" -f "$dockerfile" "$DOCKERFILES_DIR/.." > /dev/null 2>&1 &
    pid=$!
    show_spinner "$pid" "$msg"
    wait "$pid"
    build_status=$?

    if [[ $build_status -eq 0 ]]; then
        echo -e "\r${msg} ${GREEN}OK${NC}"
        echo "Running image forger_test:$IMAGE_TAG"
        podman run -it --rm "forger_test:$IMAGE_TAG"
    else
        echo -e "\r${msg} ${RED}FAIL${NC}"
        exit 1
    fi
else
    echo "Invalid OS type: $IMAGE_TAG"
    echo "Usage: $0 <os_type>"
    echo "Available OS types:"
    for os_type in "${OS_TYPES[@]}"; do
        echo " - $os_type"
    done
    exit 1
fi
