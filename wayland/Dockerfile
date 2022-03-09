FROM balenalib/genericx86-64-ext-alpine:3.15-run

RUN apk add --update --no-cache \
  sway seatd-launch kbd libinput xwayland \
  bash sudo ca-certificates udev \
  mesa mesa-dri-ati mesa-dri-intel mesa-dri-nouveau

RUN adduser --uid 1500 --shell /bin/bash --disabled-password displayuser \
  && chown -R displayuser:displayuser /home/displayuser

COPY ./groups /etc/group
RUN chmod 644 /etc/group

# Setting working directory
WORKDIR /usr/src/app

ENV UDEV=1

COPY init.sh .
COPY display-init.sh .
COPY sway.cfg .

CMD ["/bin/bash", "./init.sh"]
