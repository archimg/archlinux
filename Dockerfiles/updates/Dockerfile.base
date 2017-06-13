FROM archimg/base:currenttar
LABEL maintainer "ArchLinux Dockerimage Maintainers"

RUN    pacman --noconfirm -Syu \
    && rm -f \
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/* \
      /etc/pacman.d/mirrorlist.pacnew

CMD ["/bin/bash"]
