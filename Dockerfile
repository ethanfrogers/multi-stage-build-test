FROM golang:1.8.3-alpine

ADD . $GOPATH/src/ethanfrogers/multi-stage-build-test

RUN go install ethanfrogers/multi-stage-build-test


FROM alpine:latest
WORKDIR /bin
COPY --from=0 /go/bin/multi-stage-build-test .
ENTRYPOINT ["/bin/multi-stage-build-test"]

