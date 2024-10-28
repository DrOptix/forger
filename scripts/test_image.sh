#!/bin/bash

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

# Initialize variables
VERBOSE=false
IMAGE_TAG=""

# Check if the provided OS type is valid
VALID_OS=false
for os_type in "${OS_TYPES[@]}"; do
    if [ "$IMAGE_TAG" == "$os_type" ]; then
        VALID_OS=true
        break
    fi
done

# If the OS type is valid, build and run the image using Podman
if $VALID_OS; then
    dockerfile="$DOCKERFILES_DIR/Dockerfile.$IMAGE_TAG"
    
    # Message to display while building
    msg="Building image forger_test:${IMAGE_TAG}:"

    podman build -t "forger_test:$IMAGE_TAG" -f "$dockerfile" "$DOCKERFILES_DIR/.."

    build_status=$?

    if [[ $build_status -eq 0 ]]; then
        echo "Running image forger_test:$IMAGE_TAG"

        # Allow containers to connect to host X11 display
	    xhost +local:docker > /dev/null 2>&1

        podman run \
            -it \
            --rm \
            --privileged \
            --env DISPLAY=$DISPLAY \
            --env ANSIBLE_CONFIG=/home/test/.forger/ansible.cfg \
            --env ANSIBLE_REMOTE_TEMP=/tmp/ansible \
            --env FORGER_SECRETS_DIR=/etc/forger/secrets/ \
            --volume /tmp/.X11-unix:/tmp/.X11-unix \
            --volume $(realpath "$FORGER_SECRETS_DIR"):/etc/forger/secrets:z,ro \
            --workdir=/home/test \
            "forger_test:$IMAGE_TAG" \
            sudo -E -H -u test /home/test/.forger/scripts/forge_localhost.sh

        # Remove container access to host X11 display
	    xhost -local:docker > /dev/null 2>&1
    else
        echo "Failed to build image forger_test:$IMAGE_TAG"
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
