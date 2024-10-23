#!/bin/bash

env > /etc/entrypoint-env
echo "$(printf " %q" "${@}")" >/etc/entrypoint-cmd

cat >/etc/systemd/system/entrypoint.target <<EOF
[Unit]
Description=the target for entrypoint.service
Requires=entrypoint.service systemd-logind.service systemd-user-sessions.service
EOF

cat >/etc/systemd/system/entrypoint.service <<EOF
[Unit]
Description=entrypoint.service

[Service]
ExecStart=/bin/bash -exc "source /etc/entrypoint-cmd"
# EXIT_STATUS is either an exit code integer or a signal name string, see systemd.exec(5)
ExecStopPost=/bin/bash -ec "if echo \${EXIT_STATUS} | grep [A-Z] > /dev/null; then echo >&2 \"got signal \${EXIT_STATUS}\"; systemctl exit \$(( 128 + \$( kill -l \${EXIT_STATUS} ) )); else systemctl exit \${EXIT_STATUS}; fi"
StandardInput=tty-force
StandardOutput=inherit
StandardError=inherit
WorkingDirectory=$(pwd)
EnvironmentFile=/etc/entrypoint-env

[Install]
WantedBy=multi-user.target
EOF

systemctl enable entrypoint.service

# Starting systemd
systemd=

if [ -x /lib/systemd/systemd ]; then
	systemd=/lib/systemd/systemd
elif [ -x /usr/lib/systemd/systemd ]; then
	systemd=/usr/lib/systemd/systemd
elif [ -x /sbin/init ]; then
	systemd=/sbin/init
else
	echo >&2 'ERROR: systemd is not installed'
	exit 1
fi

systemd_args="--show-status=false --unit=entrypoint.target"
echo "$0: starting $systemd $systemd_args"
exec $systemd $systemd_args

