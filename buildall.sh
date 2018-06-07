#!/bin/bash
#
PROJECTS="geoweb-backend geoweb-frontend-nginx adaguc-server adaguc-viewer"

for PROJ in $PROJECTS ; do
  DIR=${PROJ}-docker
  echo "Building Geoweb docker $1 image for $DIR"
  (
    cd $DIR
    bash build.sh test
  )
  echo
done
