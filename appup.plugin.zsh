# Docker
_appup_docker () {
    if hash docker-compose >/dev/null 2>&1; then
        # Check if docker-machine has been started
        if hash docker-machine >/dev/null 2>&1; then            
            if docker-machine status | grep -qi "Stopped"; then
                read -q "REPLY?Docker Machine is not running, would you like to start it? [y/n] "
                echo ""
                
                if [[ "$REPLY" == "y" ]]; then
                    docker-machine start default && eval $(docker-machine env default)
                    echo ""
                else
                    return
                fi
            fi
        fi
        
        # <cmd> <project name> will look for docker-compose.<project name>.yml
        if [ -n "$2" -a -e "docker-compose.$2.yml" ]; then
            project=$(source ".env.$2"; echo $COMPOSE_PROJECT_NAME)

            if [ -n $project ]; then
                docker-compose -p "${project}" -f docker-compose.yml -f "docker-compose.${2}.yml" $1 "${@:3}"
                return
            fi

            docker-compose -f docker-compose.yml -f "docker-compose.${2}.yml" $1 "${@:3}"
            return
        fi

        docker-compose $1 "${@:2}"
    else
        echo >&2 "Docker compose file found but docker-compose is not installed."
    fi
}

# Vagrant
_appup_vagrant () {
    if hash vagrant >/dev/null 2>&1; then
        vagrant $1 "${@:2}"
    else
        echo >&2 "Vagrant file found but vagrant is not installed."
    fi
}

up () {
    if [ -e "docker-compose.yml" ]; then
        _appup_docker up "$@"
    elif [ -e "Vagrantfile" ]; then
        _appup_vagrant up "$@"
    elif hash up >/dev/null 2>&1; then
        env up "$@"
    fi
}

down () {
    if [ -e "docker-compose.yml" ]; then
        _appup_docker down "$@"
    elif [ -e "Vagrantfile" ]; then
        _appup_vagrant destroy "$@"
    elif hash down >/dev/null 2>&1; then
        env down "$@"
    fi
}

start () {
    if [ -e "docker-compose.yml" ]; then
        _appup_docker start "$@"
    elif [ -e "Vagrantfile" ]; then
        _appup_vagrant up "$@"
    elif hash start >/dev/null 2>&1; then
        env start "$@"
    fi
}

restart () {
    if [ -e "docker-compose.yml" ]; then
        _appup_docker restart "$@"
    elif [ -e "Vagrantfile" ]; then
        _appup_vagrant reload "$@"
    elif hash start >/dev/null 2>&1; then
        env start "$@"
    fi
}

stop () {
    if [ -e "docker-compose.yml" ]; then
        _appup_docker stop "$@"
    elif [ -e "Vagrantfile" ]; then
        _appup_vagrant halt "$@"
    elif hash stop >/dev/null 2>&1; then
        env stop "$@"
    fi
}
