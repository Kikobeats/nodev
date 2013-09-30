#!/bin/bash

    ###########
    # MÓDULOS #
    # #########

    # REDIS
    # Cacheado en memoria persistente de una base de datos
    redis(){
        redis_server
    }

    # Forever
    # Monitorea con un demonio un proceso.
    #
    # Node-inspector
    # Debugging para Node.js
    #
    debugging(){
        if [[ $# == 0 ]]; then
            forever /usr/local/bin/node-inspector -web-port=9999
        else
            forever /usr/local/bin/node-inspector -web-port=$1
        fi
    }

    # MongoDB
    # bbdd basado en NOSQL
    mongoDB(){
        if [[ $1 == "shell" ]]; then
            mongo
        else
            mongod
        fi
    }

    # Mata todos los procesos asociados
    disconnect(){
        killall node redis_server mongod
    }

    # HELP
    help_menu(){
        echo $'\n'" ############## "
        echo " # NODEJS DEV # "
        echo " ############## " $'\n'
        echo " Uso: $0 <comando>"
        echo "  * debug: Arranca el debug (forever+node-inspector)"
        echo "  * redis_server: Arrancar el REDIS"
        echo "  * mongod: Arranca mongod"
        echo "  * mongo: Arranca una shell de MongoDB"
        echo "  * off: Detiene todos los servicios"

        echo "Dependencias:";
        echo " * npm install node-inspector -g"
        echo " * npm install supervisor -g"
    }

    ########
    # MAIN #
    ########

    [[ $# == 0 ||  $1 == "help" ]] && help_menu || {

        if [[ $1 == "redis" ]]; then
            redis

        elif [[ $1 == "debug" ]]; then
            debugging

        elif [[ $1 == "mongo" ]]; then
            if [[ $# == 2 ]]; then
                mongoDB $2
            else
                mongoDB
            fi

        elif [[ $1 == "off" ]]; then
            disconnect

        else
            echo $'\a'" Comando no reconocido. Escriba '$0 help' para ver la ayuda"
        fi
    }