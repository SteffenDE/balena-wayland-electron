#!/bin/sh

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

echo "hello from electron image"

chown -R root:video /dev/dri
chmod -R 770 /dev/dri

sysctl -w user.max_user_namespaces=10000

while ! test -S $(find /tmp/displayserver/.wayland -name "wayland-*" | head -n 1); do
  echo "Waiting for wayland socket..."
  sleep 1000
done

chown -R displayuser:displayuser /home/displayuser
sudo -u displayuser /usr/src/start-app.sh
