function fish_greeting
    # Print Kernel, Uptime and Hostname
    echo
    echo -e (uname -ro | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e (uptime -p | sed 's/^up //' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')

    # Print network details

    echo -e " \\e[1mNetwork:\\e[0m"
    # http://tdt.rocks/linux_network_interface_naming.html
    echo -ne (\
        ip addr show up scope global | \
            grep -E ': <|inet' | \
            sed \
                -e 's/^[[:digit:]]\+: //' \
                -e 's/: <.*//' \
                -e 's/.*inet[[:digit:]]* //' \
                -e 's/\/.*//'| \
            awk 'BEGIN {i=""} /\.|:/ {print i" "$0"\\\n"; next} // {i = $0}' | \
            sort | \
            column -t -R1 | \
            # public addresses are underlined for visibility \
            sed 's/ \([^ ]\+\)$/ \\\e[4m\1/' | \
            # private addresses are not \
            sed 's/m\(\(10\.\|172\.\(1[6-9]\|2[0-9]\|3[01]\)\|192\.168\.\).*\)/m\\\e[24m\1/' | \
            # unknown interfaces are cyan \
            sed 's/^\( *[^ ]\+\)/\\\e[36m\1/' | \
            # ethernet interfaces are normal \
            sed 's/\(\(en\|em\|eth\)[^ ]* .*\)/\\\e[39m\1/' | \
            # wireless interfaces are purple \
            sed 's/\(wl[^ ]* .*\)/\\\e[35m\1/' | \
            # wwan interfaces are yellow \
            sed 's/\(ww[^ ]* .*\).*/\\\e[33m\1/' | \
            sed 's/$/\\\e[0m/' | \
            sed 's/^/\t/' \
        )
    echo
    set_color normal
end
