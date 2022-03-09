#!/bin/bash

echo "hello from display init" > /proc/1/fd/1

export XDG_RUNTIME_DIR="/tmp/displayserver/.wayland"
export WLR_LIBINPUT_NO_DEVICES=1

echo "cleaning old sockets"
rm -rf /tmp/displayserver/*
rm -rf /tmp/displayserver/.*
echo "creating new directories"
mkdir /tmp/displayserver/.X11-unix
mkdir -p "$XDG_RUNTIME_DIR"
echo "linking directories"
ln -s /tmp/displayserver/.X11-unix/ /tmp/
ln -s /tmp/displayserver/.wayland/ /tmp/

chmod 0700 "$XDG_RUNTIME_DIR"
chown -R displayuser:displayuser /tmp/displayserver

while true
do
  chvt 7
  sudo -E -u displayuser -- seatd-launch sway -c sway.cfg -d &> /proc/1/fd/1
  echo "sway crashed or exited..." > /proc/1/fd/1
  chvt 1
  sleep 5
done
