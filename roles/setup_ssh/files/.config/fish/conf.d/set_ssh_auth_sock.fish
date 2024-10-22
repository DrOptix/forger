#!/bin/fish

# Check if SSH_AUTH_SOCK is set, if not, set it
if not set -q SSH_AUTH_SOCK
    set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
end
