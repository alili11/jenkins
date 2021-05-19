#!/bin/bash
mkdir -p /app
chmod 400 /app
cp helloWorld.class /app
cd /app
java helloWorld
