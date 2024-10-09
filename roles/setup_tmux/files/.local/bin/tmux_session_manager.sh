#!/bin/bash

# List of directories to search for projects
PROJECT_SEARCH_DIRS=(
    ~/.config
    ~/Documents/work/
    ~/Documents/github/
)

# The path of the project can be given as a paramter
# or it can be selected from the projects found in the
# locations specified in `$PROJECT_SEARCH_DIRS`.
if [[ $# -eq 1 ]]; then
    project_path=$1
else
    project_path=$(find "${PROJECT_SEARCH_DIRS[@]}" -mindepth 1 -maxdepth 1 -type d | fzf)
fi

# Exit if the path is not found
if [[ -z $project_path ]]; then
    echo "Project path not found: $project_path"
    exit 1
fi

# If a project contains a `.` in the name we replace it with `_`
session_name=$(basename $project_path | tr . _)

is_tmux_running=$(pgrep tmux)

# Create new session if `tmux` is not running, we automatically attach to it.
if [[ -z $TMUX ]] && [[ -z $is_tmux_running ]]; then
    tmux new-session -s $session_name -c $project_path
fi

# At this point we know `tmux` is running
#
# We check if a session exists, if it is missing we create it detached
if ! tmux has-session -t $session_name 2> /dev/null; then
    tmux new-session -ds $session_name -c $project_path
fi

# If we are outside `tmux` we attach to the session
# If we are inside `tmux` we switch to it
if [[ -z $TMUX ]]; then
    tmux attach -t $session_name
else
    tmux switch-client -t $session_name
fi

