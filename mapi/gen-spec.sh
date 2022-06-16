#!/bin/bash

# Generate API Spec
protoc -I . --openapiv2_out . \
    --openapiv2_opt logtostderr=true \
    --openapiv2_opt generate_unbound_methods=true \
    ../net/grpc/gateway/examples/echo/echo.proto

