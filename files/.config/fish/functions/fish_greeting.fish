function fish_greeting
    # Print Kernel and Hostname
    echo

    # Print kernel release and operating system
    set_color --bold normal; echo -n "OS: "
    set_color green; echo (uname -ro)

    # Print hostname
    set_color --bold normal; echo -n "Hostname: "
    set_color green; echo (uname -n)

    set_color normal
    echo
end
