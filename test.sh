#!/bin/bash
set -eu

stop() {
  ret=$?

  for ctr in minio dynamo setup sunlight-setup sunlight woodpecker; do
    echo "logs for $ctr:"
    docker logs "sunlight-test-$ctr-1" || echo "no logs"
  done

  docker compose down

  exit $ret
}

trap stop EXIT

# Build containers:
docker compose build

# Start services in background
docker compose up -d --wait

# Wait for woodpecker to finish
RET=$(docker wait sunlight-test-woodpecker-1)
if [ "$RET" != "0" ]; then
  echo "woodpecker returned $RET"
  exit 1
fi
echo "Success"
