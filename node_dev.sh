#!/bin/bash

    ###########
    # MÓDULOS #
    # #########

    # REDIS
    # Cacheado en memoria persistente de una base de datos
    redis(){
        redis-server
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

    # Supervisor
    # Arranca Nodejs con actualización persistende de archivos
    # También activamos el flag debug para node-inspector
    run_node(){
        supervisor --debug $1
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
        echo " Uso: $0 <comando>" $'\n'
        echo "  * [nombre_fichero]: Arranca Node.js con actualización persistente (supervisor)"
        echo "  * debug: Arranca el debug (forever+node-inspector)"
        echo "  * redis: Arrancar el REDIS"
        echo "  * mongod: Arranca mongod"
        echo "  * mongo: Arranca una shell de MongoDB"
        echo "  * off: Detiene todos los servicios"$'\n'
    }

    ########
    # MAIN #
    ########
    REGEX=`echo $1 | grep -qx *.js`

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

        elif [[ !$REGEX ]]; then
            run_node $1

        else
            echo $'\a'" Comando no reconocido. Escriba '$0 help' para ver la ayuda"
        fi
    }