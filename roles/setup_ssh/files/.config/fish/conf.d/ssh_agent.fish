#!/usr/bin/env fish

if not pgrep -u $USER ssh-agent > /dev/null
    eval (ssh-agent -c -a /home/$USER/.ssh/ssh_agent.socket)

    set -gx SSH_AUTH_SOCK "$SSH_AUTH_SOCK"
    set -gx SSH_AGENT_PID "$SSH_AGENT_PID"
end

