#!/bin/bash

#ROOT_DIR=`realpath $(dirname $0)/..`
ROOT_DIR=$(pwd)
echo $ROOT_DIR

function build_caller {
    sudo docker build -t zyuxuan0115/caller-c:latest \
        -f Dockerfile.caller --no-cache \
        $ROOT_DIR
}

function build_caller {
    sudo docker build -t zyuxuan0115/callee-c:latest \
        -f Dockerfile.callee --no-cache \
        $ROOT_DIR
}



function push {
    sudo docker push zyuxuan0115/caller-c:latest
    sudo docker push zyuxuan0115/callee-c:latest
}

function build {
    build_caller
    build_callee
}

case "$1" in
build)
    build
    ;;
push)
    push
    ;;
esac
