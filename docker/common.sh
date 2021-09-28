#!/bin/bash

### Include ###
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
SRC_DIR=$(dirname "$SCRIPT_DIR")
. "$SCRIPT_DIR"/config.sh

### Check whether the contrainers base image already exsits
CONTAINER=$(docker ps -a \
    --filter name="$PROJECT_NAME" \
    --format "{{.ID}}")

### Common Functions ###
function start_container() {
    echo "👨‍💻  Starting docker container "
    # if ~/data does not exists, create it
    [ ! -d ~/data ] && mkdir ~/data

    docker run \
        --name "$PROJECT_NAME" \
        -v ~/data:/workspace/data \
        -v "$SRC_DIR"://workspace/"$PROJECT_NAME" \
        -p "$JUPYTER_PORT":8888 \
        --gpus $GPU \
        -w $WORKSPACE \
        -dit $BASE_IMAGE_NAME

    CONTAINER=$(docker ps -a \
        --filter ancestor="$BASE_IMAGE_NAME" \
        --format "{{.ID}}")
    echo "✅ $BASE_IMAGE_NAME -- $CONTAINER was started "
}

function restart_existing_container() {
    echo "👨‍💻  Restarting container $CONTAINER"
    docker restart "$CONTAINER"
}

function init() {
    if [ -z "$CONTAINER" ]; then
        start_container
    else
        restart_existing_container
    fi
}

function exec_bash() {
    if [ -z "$CONTAINER" ]; then
        echo "❌ Docker container is NOT created."
    else
        echo "👨‍💻 Starting bash process of $BASE_IMAGE_NAME -- $CONTAINER"
        docker exec -it "$CONTAINER" /bin/bash
    fi
}

function exec_notebook() {
    echo "👨‍💻 Starting Jupyterlab process of $BASE_IMAGE_NAME -- $CONTAINER"
    notebook_cmd="jupyter lab --ip=0.0.0.0 --port 8888 --allow-root"
    docker exec -it $CONTAINER $notebook_cmd
}
