#!/bin/bash

DOCKER_HUB_USERNAME="" # You docker hub user name
PROJECT_NAME="ubuntu"  # Your project name on docker hub
DOCKER_TAG="latest"    # Your project tag of your docker image

if [ -z DOCKER_HUB_USERNAME ]
then
    BASE_IMAGE_NAME="$PROJECT_NAME:$DOCKER_TAG"
else
    BASE_IMAGE_NAME="$DOCKER_HUB_USERNAME/$PROJECT_NAME:$DOCKER_TAG"  
fi

WORKSPACE="/workspace"  # The workspace name in docker
JUPYTER_PORT="8080"     # The jupyter lab port exposed on the host
GPU="0"                 # The number of gpu
