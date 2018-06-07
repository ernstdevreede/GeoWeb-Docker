#!/bin/sh
echo "Building build env"
image=geoweb-frontend-nginx
if [ "$1" = "test" ]; then
  image="${image}-test" 
fi

docker build -t nodebuild . -f Dockerfile.nodebuild
#
docker create --name extract nodebuild
docker cp extract:/frontend/geoweb-frontend/dist dist
docker rm -f extract

echo Building nginx runner $image
docker build  -t $image . -f Dockerfile.geoweb-frontend-nginx
rm -r dist
#docker save -o ${image}.dockerimage geoweb-frontend-nginx
