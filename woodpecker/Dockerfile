ARG GO_VERSION

FROM golang:${GO_VERSION}-bookworm as build

# TODO: This is using a local clone/fork of sunlight-woodpecker until a release is tagged
COPY sunlight-woodpecker /app

WORKDIR /app/cmd/woodpecker
RUN go build -o /bin/woodpecker .

FROM debian:bookworm

COPY --from=build /bin/woodpecker /bin/woodpecker

CMD /bin/woodpecker
