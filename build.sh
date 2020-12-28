#!/usr/bin/env bash

set -e -x

wget -O jna.jar https://repo1.maven.org/maven2/net/java/dev/jna/jna/5.6.0/jna-5.6.0.jar

go build -o darwin/awesome.so -buildmode=c-shared awesome.go
mv darwin/awesome.so darwin/libawesome.so.dylib

javac -cp jna.jar Client.java && java -cp .:jna.jar Client