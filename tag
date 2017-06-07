#!/bin/bash -ex

ORGA=archimg

for repo in base base-devel; do
	docker tag archimg-${repo} ${ORGA}/${repo}
done

docker tag archimg-base       base/archlinux
docker tag archimg-base-devel base/devel
