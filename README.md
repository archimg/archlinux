# Basic ArchLinux images

[![Build Status](https://travis-ci.org/archimg/archlinux.svg?branch=master)](https://travis-ci.org/archimg/archlinux)

Docker images for ArchLinux.

Images get built by TravisCI cronjob on publicly visible structure.

## Issues and Improvements

If you want to contribute, get to the [issues-section of this repository](https://github.com/archimg/archlinux/issues).

## Common Hurdles

### Setting the timezone

Simply add the `TZ` environment-variable and define it with a valid timezone-value.

```
docker run -e TZ=Europe/Berlin archimg/base
```

## Building

### Prerequisites

- [docker-squash](https://github.com/goldmann/docker-squash/)
- sudo or root is absolutely neccessary to build the image from scratch

## Internals

### Layers and Tags

**Use always the `latest`-tag for your image.**

The image consists of 2 parts:

- the _[basement layer](./Dockerfiles/basement)_ derived from the tarball (updated monthly)
  - this layer has always its own tag in form of `YEAR.MONTH.01`
  - It's discouraged to use this as your image base
- the _[update layer](./Dockerfiles/updates)_, which only contains the updates (updated daily)
  - this layer has always its own tag as latest

This implies, that you get daily updates, but only have to download the actual change and not the full image.
