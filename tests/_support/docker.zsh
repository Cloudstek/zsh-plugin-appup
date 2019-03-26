#!/usr/bin/env zsh

_setup_simple_env () {
    ext='yml'
    if [ -n "$1" ]; then
        ext=$1
    fi
    
    cd $APPUP_TMP
    
    touch docker-compose.$ext
}

_setup_project_env () {
    project=$1
    
    if [ -z "$1" ]; then
        >&2 echo "Empty project name."
        exit 2
    fi
    
    ext='yml'
    if [ -n "$2" ]; then
        ext=$2
    fi
    
    cd $APPUP_TMP
    
    touch {docker-compose,docker-compose.$project}.$ext
}
