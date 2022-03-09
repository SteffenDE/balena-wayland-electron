FROM balenalib/amd64-ubuntu:impish-run as kiosk

# env vars for system
ENV DEBIAN_FRONTEND=noninteractive
ENV DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
# tell balena image to enable udev
ENV UDEV=1
  # ----- software install start -----
RUN apt -q update \
  && apt -y -q upgrade \
  && apt -y -q install --no-install-recommends \
  bash sudo git nodejs npm \
  tzdata locales \
  # ---- libs for graphics ----
  libegl1-mesa libgles2-mesa libgl1-mesa-dri \
  i965-va-driver intel-media-va-driver vainfo \
  # ---- libs for electron ----
  libglib2.0-0 libnss3 libatk1.0-0 \
  libatk-bridge2.0-0 libgtk-3-0 libcups2 \
  libasound2 \
  # ---- end ----
  # cleanup
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  # ----- software install finished -----
  # create user
  && useradd -u 1500 -m displayuser -s /bin/bash \
  && usermod -a -G audio,video,tty,input displayuser \
  && chown -R displayuser:displayuser /home/displayuser

COPY . /usr/src/
WORKDIR /usr/src/app

RUN npm install

CMD ["/bin/bash", "/usr/src/entrypoint.sh"]
