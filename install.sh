#!/bin/sh

bin_dir="/usr/local/bin"
docker_image_name="guardian-agent-build-docker"

if [ ! -d ./build ]
then
  mkdir build
fi

docker build . -t $docker_image_name
docker run -v "$(pwd)/build:/build" -it $docker_image_name sh

cp -v build/bin/* "$bin_dir"
cp -v build/scripts/* "$bin_dir"
