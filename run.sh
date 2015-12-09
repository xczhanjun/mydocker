#!/usr/bin/env bash
set -e

if [ "$1" == "build" ]
then
	docker build -rm -t zhanjun/mydocker .
fi

if [ "$1" == "push" ]
then
	docker push zhanjun/mydocker
fi


docker run -it -p 80:80 --name mydocker_env zhanjun/mydocker


