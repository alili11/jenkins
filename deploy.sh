#!/bin/bash
mkdir -p /app
chmod 777 /app
cp helloWorld.class /app
cd /app
java helloWorld
