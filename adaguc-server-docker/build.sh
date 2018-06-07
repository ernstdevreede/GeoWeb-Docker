#!/bin/sh
image=adaguc-server
if [ "$1" = "test" ]; then
  image="${image}-test"
fi
echo "Building build $image"

docker build -t $image .

#docker save -o ${image}.dockerimage ${image}
