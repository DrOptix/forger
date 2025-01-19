function fish_prompt
    # Print hour and minutes using the normal color
    set_color normal
    echo -n "["(date "+%H:%M")"] "

    # Print user name using yellow
    set_color yellow
    echo -n (whoami)

    # Print the `@` in the normal color
    set_color normal
    echo -n "@"

    # Print the host name using blue color
    set_color blue
    echo -n (hostname)

    # Print the base name of $PWD only if we are not in $HOME.
    # Use the normal color for `:` separator.
    # Use yellow for the $PWD base name
    if [ $PWD != $HOME ]
        set_color normal
        echo -n ":"

        set_color yellow
        echo -n (basename $PWD)
    end

    # Print git prompt in green
    set_color green
    printf "%s" (__fish_git_prompt)

    # Add a space as padding
    echo -n " "

    # Print the `|` separator in red
    set_color red
    echo -n "|"

    # Add a space as padding
    echo -n " "

    # Reset the color to the normal color
    set_color normal
end

