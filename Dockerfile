FROM harbor.vaneplus.com:30003/test/golang:1.11.3-alpine3.8 as builder

WORKDIR /go/src/kubesphere.io/devops-go-sample/

COPY . .

RUN go build -o hello-world

FROM harbor.vaneplus.com:30003/test/alpine:latest

COPY --from=builder /go/src/kubesphere.io/devops-go-sample/hello-world /usr/local/bin/

EXPOSE 8080
CMD ["/usr/local/bin/hello-world"]
