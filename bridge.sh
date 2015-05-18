#!/bin/bash

PID_FILE=$(pwd)"/blockstore-bridge.pid"

case $1 in
    "start")
            echo 'Starting blockstore-bridge'
            rackup -E test &
            ;;
   "stop")
          echo 'Stopping blockstore-bridge'
            cat ${PID_FILE} | xargs kill -SIGINT
           ;;
    esac