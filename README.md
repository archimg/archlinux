# Basic ArchLinux images

[![Build Status](https://travis-ci.org/archimg/archlinux.svg?branch=master)](https://travis-ci.org/archimg/archlinux)

Docker images for ArchLinux.

Images get built by TravisCI cronjob on publicly visible structure.

## Building

### Prerequisites

- [docker-squash](https://github.com/goldmann/docker-squash/)

## Issues and Improvements

If you want to contribute, get to the [issues-section of this repository](https://github.com/archimg/archlinux/issues).

## Setting the timezone

Simply add the `TZ` environment-variable and define it with a valid timezone-value.

```
docker run -e TZ=Europe/Berlin archimg/base
```
