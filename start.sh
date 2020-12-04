#!/usr/bin/env bash

# Start HP's smart update manager service
/sbin/smartupdate

# Wait for process to end
pid=$(pgrep sum_service)
/usr/bin/tail --pid=$pid -f /dev/null 
