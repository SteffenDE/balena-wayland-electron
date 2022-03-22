#!/bin/sh

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
export XDG_RUNTIME_DIR=/tmp/.wayland
export WAYLAND_DISPLAY=$(find $XDG_RUNTIME_DIR/ -name "wayland-*" | head -n 1 | cut -d "/" -f 4)
export SWAYSOCK=$(find $XDG_RUNTIME_DIR/ -name "sway-ipc.*" | head -n 1)
# uncomment to use xwayland
# export DISPLAY=:0
# export XAUTHORITY=/tmp/displayserver/.Xauthority
export LIBVA_MESSAGING_LEVEL=2
export LIBVA_DRIVER_NAME=i965

while true
do
  $(npm bin)/electron . --ozone-platform=wayland --in-process-gpu $@
  echo "app crashed"
  sleep 5
done
