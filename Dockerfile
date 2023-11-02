FROM golang:1.21 as builder
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o main main.go
RUN cp main /go/bin/app

FROM scratch 
COPY --from=builder /go/bin/app /
CMD ["/app"]
