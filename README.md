# Basic Arch Linux images [![Build Status](https://travis-ci.org/archimg/archlinux.svg?branch=master)](https://travis-ci.org/archimg/archlinux)

Docker images for Arch Linux. Built daily by Travis CI on publicly visible infrastructure.

## Running the images

The images are on [Docker Hub](https://hub.docker.com/u/archimg/). Use the convenient `docker run`:

    docker run --rm -ti archimg/base
    docker run --rm -ti archimg/base-devel

## Tags

|         Repo         |  Tag   |  Update   |  Type   |                                                             Description                                                              |
|:---------------------|:------:|:---------:|:-------:|:-------------------------------------------------------------------------------------------------------------------------------------|
| base                 | latest | **daily** | minimal | most packages of base-group, except some big ones like [`linux-firmware`](./Dockerfiles/basement/Dockerfile.base)                    |
| base                 | full   | **daily** |   full  | all packages of base-group                                                                                                           |
| base&#8209;devel     | latest | **daily** |   full  | all packages of base and base-devel-group                                                                                            |

**The monthly tagged images aren't supposed to be used in production.** Arch Linux is a rolling release distro and [partial upgrades are unsupported there](https://wiki.archlinux.org/index.php?title=System_maintenance#Partial_upgrades_are_unsupported). It requires you to always do a full system upgrade, so it wouldn't make any difference to use the `latest` tag.

### Layer structure

The image consists of two parts:

- the _[basement layer](./Dockerfiles/basement)_, derived from the tarball (updated monthly)
  - this layer has always its own tag in form of `YEAR.MONTH.01`
  - it's discouraged to use this as your base image
- the _[update layer](./Dockerfiles/updates)_, which only contains the updates (updated daily)
  - this layer has always its own tag as latest

This implies, that you get daily updates, but only have to download the actual change and not the full image.

## Issues and improvements

If you want to contribute, get to the [issues-section of this repository](https://github.com/archimg/archlinux/issues).

## Common hurdles

### Setting the timezone

Simply add the `TZ` environment-variable and define it with a valid timezone-value.

```
docker run -e TZ=Europe/Berlin archimg/base
```

## Building it yourself

### Prerequisites

- [docker-squash](https://github.com/goldmann/docker-squash/)
- sudo or root is absolutely neccessary to build the image from scratch
  - if you use `./pull` instead of `./build`, sudo is not required

### Building

- Run either `sudo -H ./build` **OR** `./pull`
  - If you run `sudo -H ./build`, it'll download the tarball and build the images from scratch **sudo required**
  - If you run `./pull`, docker will download the images from dockerhub
- Run `./update` to generate the `latest`-tags and update the images.

If you want to push the images, run `./push`. *But be aware you have no push access to the repos!*
