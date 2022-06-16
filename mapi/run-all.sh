#!/bin/bash

docker run -d --rm -p 9090:9090 --name node-server grpcweb/node-server
docker run -d --rm -p 8080:8080 --name envoy-proxy --link node-server:node-server grpcweb/envoy
docker run -d --rm -p 8081:8081 --name commonjs-client grpcweb/commonjs-client
