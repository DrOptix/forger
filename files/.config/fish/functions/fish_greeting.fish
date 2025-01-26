function fish_greeting
    # Print Kernel and Hostname
    echo

    # Print kernel release and operating system
    set_color --bold normal; echo -n "OS: "
    set_color green; echo (uname -ro)

    # Print uptime
    set_color --bold normal; echo -n "Uptime: "

    set -l uptime_secs (awk '{print $1}' /proc/uptime)
    set -l seconds_in_minute 60
    set -l seconds_in_hour (math "60 * $seconds_in_minute")
    set -l seconds_in_day (math "24 * $seconds_in_hour")

    # Calculate days
    set -l days (math "$uptime_secs / $seconds_in_day")
    set -l rounded_days (math "floor($days)")
    set -l remaining_secs (math "$uptime_secs % $seconds_in_day")

    # Calculate hours
    set -l hours (math "$remaining_secs / $seconds_in_hour")
    set -l rounded_hours (math "floor($hours)")
    set -l remaining_secs (math "$remaining_secs % $seconds_in_hour")

    # Calculate minutes
    set -l minutes (math "$remaining_secs / $seconds_in_minute")
    set -l rounded_minutes (math "floor($minutes)")

    set_color green
    echo -n "$rounded_days days, "
    echo -n "$rounded_hours hours, "
    echo "$rounded_minutes minutes"

    # Print hostname
    set_color --bold normal; echo -n "Hostname: "
    set_color green; echo (uname -n)

    set_color normal
    echo
end
