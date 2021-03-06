FROM arm64v8/golang:1.10-alpine AS build

RUN apk add --update --no-cache ca-certificates gcc git musl-dev && \
    mkdir -p /go/src/github.com/StanfordSNR /build && \
    cd /go/src/github.com/StanfordSNR && \
    git clone https://github.com/StanfordSNR/guardian-agent.git && \
    cd /go/src/github.com/StanfordSNR/guardian-agent && \
    git submodule init && \
    git submodule update && \
    CGO_ENABLED=0 go get -v ./...

COPY ./copy-to-build.sh .

VOLUME /build

ENTRYPOINT ["./copy-to-build.sh"] 
