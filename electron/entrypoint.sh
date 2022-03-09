#!/bin/sh

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

echo "hello from electron image"

chown -R root:video /dev/dri
chmod -R 770 /dev/dri

# link displayserver sockets to shared volume
ln -s /tmp/displayserver/.X11-unix/ /tmp/
ln -s /tmp/displayserver/.wayland/ /tmp/
ln -s /tmp/displayserver/.Xauthority /home/displayuser/

sysctl -w user.max_user_namespaces=10000

chown -R displayuser:displayuser /home/displayuser
sudo -u displayuser /usr/src/start-app.sh

sleep infinity
