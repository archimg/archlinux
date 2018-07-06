FROM scratch
LABEL maintainer "ArchLinux Dockerimage Maintainers"

ADD arch-rootfs/ /
ADD additional/ /

RUN : \
    # chmod /etc, because during add, there is /etc/resolv.conf
    # mounted (and therefore /etc/ created with the umask of the host)
    # if the umask is not ``
    && chmod 755 /etc \
    && pacman-key --init \
    && pacman-key --populate archlinux \
    && pacman --noconfirm -Syu --needed base \
    # remove unneccessary packages again
    && pacman --noconfirm -Rsc \
         cryptsetup \
         device-mapper \
         dhcpcd \
         iproute2 \
         jfsutils \
         linux \
         lvm2 \
         man-db \
         man-pages \
         mdadm \
         nano \
         netctl \
         openresolv \
         pciutils \
         reiserfsprogs \
         s-nail \
         systemd-sysvcompat \
         usbutils \
         vi \
         xfsprogs \
    && rm -rf \
      /usr/share/man/* \
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/* \
      /README \
      /etc/pacman.d/mirrorlist.pacnew

CMD ["/bin/bash"]
