#!/bin/bash -e
VERSION=`cat VERSION`
TAG="shippableimages/ubuntu1204_php:$VERSION"
echo "Building $TAG"
docker build --rm -t $TAG .
