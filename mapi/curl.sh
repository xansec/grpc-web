curl -X POST 'http://localhost:8080/grpc.gateway.testing.EchoService/Echo' \
  -H 'Content-Type: application/grpc-web-text' \
  -H 'Accept: application/grpc-web-text' \
  --data-raw 'AAAAAAcKBWhlbGxv' \
  --compressed
