#!/bin/bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

if which udevadm > /dev/null; then
  set +e # Disable exit on error
  udevadm control --reload-rules
  service udev restart
  udevadm trigger
  set -e # Re-enable exit on error
fi

# first switch back to vt1
chvt 1
# run display init on vt7
openvt -c 7 -f -- ./display-init.sh

echo "sleeping!"
sleep infinity
