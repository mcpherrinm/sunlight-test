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
for ctr in minio dynamo setup sunlight-setup sunlight woodpecker; do
  echo "logs for $ctr:"
  docker logs "sunlight-test-$ctr-1"
done
