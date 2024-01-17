ARG GO_VERSION

FROM golang:${GO_VERSION}-bookworm as build

ENV GOBIN=/bin
RUN go install github.com/google/certificate-transparency-go/preload/preloader@v1.1.7

FROM debian:bookworm

RUN apt-get -y update &&  \
     apt-get install --no-install-recommends  \
     -y ca-certificates && \
     rm -rf /var/lib/apt/lists/*

COPY --from=build /bin/preloader /bin/preloader
