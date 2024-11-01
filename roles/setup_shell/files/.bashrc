# Load the system wide config
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Load the environment file
ENV_FILE="$HOME/.config/environment"

if [ -f "$ENV_FILE" ]; then
    while IFS= read -r line; do
        # Parse and process ADD_PATH lines, ignoring comments and empty lines
        # Ignore comments and empty lines
        if [[ ! "$line" =~ ^\s*# && "$line" =~ ^\s*ADD_PATH ]]; then
            # Extract the path after "ADD_PATH"
            path_to_add="${line#ADD_PATH }"

            # Remove quotes if they exist
            path_to_add="${path_to_add//\"/}"

            # Add to PATH if not already present
            if [[ ":$PATH:" != *":$path_to_add:"* ]]; then
                export PATH="$path_to_add:$PATH"
            fi
        fi

        # Ignore comments and empty lines
        if [[ ! "$line" =~ ^\s*# && "$line" =~ ^\s*VAR ]]; then
            # Trim the "VAR " prefix from the line
            line="${line#VAR }"

            var_name="${line%% *}"
            var_value="${line#"$var_name "}"

            # Remove quotes if they exist
            var_value="${var_value//\"/}"

            # Export the variable
            export "$var_name=$var_value"
        fi
    done < "$ENV_FILE"
fi
