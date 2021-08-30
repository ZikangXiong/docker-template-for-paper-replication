#!/bin/bash

### Include ###
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
. "$SCRIPT_DIR"/common.sh

#### Start ####
init
exec_notebook