#!/bin/bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
export XDG_RUNTIME_DIR="/tmp/displayserver/.wayland"
export WLR_LIBINPUT_NO_DEVICES=1

echo "cleaning old sockets"
rm -rf /tmp/displayserver/*
rm -rf /tmp/displayserver/.*
echo "creating new directories"
mkdir -p "$XDG_RUNTIME_DIR"

chmod 0700 "$XDG_RUNTIME_DIR"
chown -R displayuser:displayuser /tmp/displayserver

sudo -E -u displayuser -- seatd-launch sway -c sway.cfg
