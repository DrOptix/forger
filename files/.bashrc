# Be nice to sys admins
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
  source /etc/bash.bashrc
fi

if [ -f "$HOME/.environment" ]; then
    source "$HOME/.environment"
fi
