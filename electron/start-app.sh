#!/bin/sh

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
export XDG_RUNTIME_DIR=/tmp/displayserver/.wayland
export WAYLAND_DISPLAY=$(find $XDG_RUNTIME_DIR/ -name "wayland-*" | head -n 1 | cut -d "/" -f 5)
export SWAYSOCK=$(find $XDG_RUNTIME_DIR/ -name "sway-ipc.*" | head -n 1)
export ELECTRON_OZONE_PLATFORM_HINT=wayland

$(npm bin)/electron . $@
