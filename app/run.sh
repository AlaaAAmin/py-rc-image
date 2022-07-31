#!/bin/sh

#starting redis
redis-server &
#starting the app
export $(cat .env | xargs) && python hello.py