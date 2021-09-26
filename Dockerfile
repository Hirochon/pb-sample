FROM golang:1.17.1-buster

WORKDIR /go/src/work

COPY ./ /go/src/work/

RUN apt-get update && \
    apt-get install -y protobuf-compiler && \
    apt-get install -y locales file && \
    locale-gen ja_JP.UTF-8 && \
    localedef -f UTF-8 -i ja_JP ja_JP
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:jp
ENV LC_ALL=ja_JP.UTF-8

RUN go install -v github.com/ramya-rao-a/go-outline@v0.0.0-20210608161538-9736a4bde949 && \
    go install -v golang.org/x/tools/gopls@v0.7.2 && \
    go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26 && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1

ENV PATH="$PATH:$(go env GOPATH)/bin"