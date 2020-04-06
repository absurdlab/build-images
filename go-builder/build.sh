#/bin/bash

DOCKER_REGISTRY=registry.cn-hangzhou.aliyuncs.com
IMAGE_NAME=absurdlab/go-builder

read -p $'Image version [latest]: ' IMAGE_VERSION
read -p $'Docker username [davidiamyou@gmail.com]: ' DOCKER_USERNAME
read -sp $'Docker password: ' DOCKER_PASSWORD

if [[ -z "$DOCKER_USERNAME" ]]; then
    DOCKER_USERNAME=davidiamyou@gmail.com
fi

if [[ -z "$IMAGE_VERSION" ]]; then
    IMAGE_VERSION=latest
fi

echo "\n\nLogging into docker registry $DOCKER_REGISTRY"
echo $DOCKER_PASSWORD | docker login --username=$DOCKER_USERNAME $DOCKER_REGISTRY --password-stdin

echo "\nBuilding image $IMAGE_NAME:$IMAGE_VERSION"
docker build -t $IMAGE_NAME:$IMAGE_VERSION . --build-arg CHINA=yes
docker tag $IMAGE_NAME:$IMAGE_VERSION $DOCKER_REGISTRY/$IMAGE_NAME:$IMAGE_VERSION

echo "\nPushing image"
docker push $DOCKER_REGISTRY/$IMAGE_NAME:$IMAGE_VERSION