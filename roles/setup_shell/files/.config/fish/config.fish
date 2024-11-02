# NOTE: No need to load system wide config as they are loaded
#       by default.

set ENV_FILE "$HOME/.config/environment"

if test -f $ENV_FILE
    for line in (cat "$ENV_FILE")
        # Parse and process ADD_PATH lines, ignoring comments and empty lines
        if not string match -qr "^\s*#" "$line" && string match -qr "^\s*ADD_PATH" "$line"
            # Extract the path after "ADD_PATH"
            set path_to_add (string replace "ADD_PATH " "" "$line")
            set path_to_add (string replace -a '"' " " "$path_to_add")
            set path_to_add (string trim "$path_to_add")

            # Add to PATH if not already present
            if not string match -r ":$PATH:" -- ":$path_to_add:"
                set -gx PATH "$path_to_add:$PATH"
            end
        end

        # Parse and process VAR lines, ignoring commends and empty lines
        if not string match -qr "^\s*#" "$line" && string match -qr "^\s*VAR" "$line"
            # Extract variable name and value
            set line (string replace "VAR " "" "$line")
            set line (string trim "$line" )
            set line (string split " " "$line")
            set var_name $line[1]
            set var_value (string join " " (string split " " $line)[2..])

            # Remove quotes if they exist
            set var_value (string replace -a '"' "" "$var_value")

            # Export the variable
            set -gx $var_name $var_value
        end
    end
end

# Put aliases or other helper for interactive `fish` bellow

# Use `eza` instead of standard `ls`
alias l="eza"
alias ls="eza"
alias ll="eza -lb"
alias lla="eza -lab"
alias llt="eza -lab --tree"

