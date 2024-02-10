#!/bin/bash

set -eu

stop() {
  docker compose down
}

trap stop EXIT

# Build containers:
docker compose build

# Start services in background
docker compose up -d

# Wait for woodpecker to finish
docker wait sunlight-test-woodpecker-1

# Print logs
for ctr in sunlight-test-woodpecker-1 sunlight-test-sunlight-1 sunlight-test-sunlight-setup-1 sunlight-test-setup-1 sunlight-test-minio-1 sunlight-test-dynamo-1; do 
  echo "logs for $ctr"
  docker logs $ctr
done
