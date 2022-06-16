#!/bin/bash

TARGET_URI="http://localhost:8080/"

# Run mAPI
mapi run forallsecure/grpc-web-echo-example \
60 \
--url $TARGET_URI \
"net/grpc/gateway/examples/echo/echo.swagger.json" \
--har out.har \
$@
