#!/usr/bin/env fish

set socket_path "/home/$USER/.ssh/ssh_agent.socket"

if not pgrep -u $USER ssh-agent > /dev/null
    eval (ssh-agent -c -a "$socket_path")
end

set -gx SSH_AUTH_SOCK "$socket_path"
set -gx SSH_AGENT_PID "$(pgrep ssh-agent)"

