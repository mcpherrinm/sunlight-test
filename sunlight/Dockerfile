ARG GO_VERSION

FROM golang:${GO_VERSION}-bookworm as build

# TODO: This is using a local clone/fork of filippo.io/sunlight
# TODO: Once required changes are upstreamed, this should just `go install`
COPY sunlight /app

WORKDIR /app/cmd/sunlight
RUN go build -o /bin/sunlight .

FROM debian:bookworm

RUN apt-get -y update &&  \
     apt-get install --no-install-recommends  \
     -y curl ca-certificates && \
     rm -rf /var/lib/apt/lists/*

COPY --from=build /bin/sunlight /bin/sunlight

CMD /bin/sunlight
