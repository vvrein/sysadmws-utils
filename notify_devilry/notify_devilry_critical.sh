#!/bin/bash

# Set vars
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
if [[ "$LANG" != "en_US.UTF-8" ]]; then export LANG=C ; fi
HOSTNAME=$(hostname -f)

# Send test
echo '{
	"severity": "critical",
	"service": "server",
	"resource": "'$HOSTNAME'",
	"event": "notify_devilry_critical",
	"group": "software",
	"value": "critical",
	"text": "critical test alarm sent with notify_devilry_critical.sh",
	"origin": "notify_devilry_critical.sh",
	"timeout": 300,
	"correlate": ["notify_devilry_ok"]
}' | /opt/sysadmws/notify_devilry/notify_devilry.py --debug --force-send
