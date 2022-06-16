#!/bin/bash

TARGET_URI="http://localhost:9091/"

# Generate Gateway
protoc -I . --grpc-gateway_out . \
    --grpc-gateway_opt logtostderr=true \
    --grpc-gateway_opt paths=source_relative \
    --grpc-gateway_opt generate_unbound_methods=true \
   net/grpc/gateway/examples/echo/echo.proto

# Generate API Spec
protoc -I . --openapiv2_out . \
    --openapiv2_opt logtostderr=true \
    --openapiv2_opt generate_unbound_methods=true \
    net/grpc/gateway/examples/echo/echo.proto

# Run proxy
go run rest-proxy.go

# Run mAPI
mapi run forallsecure/grpc-web-echo-example \
60 \
--url $TARGET_URI \
"net/grpc/gateway/examples/echo/echo.swagger.json" \
--har out.har \
$@
