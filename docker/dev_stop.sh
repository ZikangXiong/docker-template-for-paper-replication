#!/bin/bash

### Include ###
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
. "$SCRIPT_DIR"/common.sh

FLAGS=$* 


function stop(){
    if [ -z "$CONTAINER" ]
    then
        echo "❌ Docker container is NOT created."
    else
        ret_id=$(docker stop "$CONTAINER")
        echo "🛑 Stopping $ret_id"

        if [[ $FLAGS == -r ]] 
        then 
            echo "🗑  Removing the container $CONTAINER"
            ret_id=$(docker rm "$CONTAINER")
        fi
    fi
}


### stop ###
stop
