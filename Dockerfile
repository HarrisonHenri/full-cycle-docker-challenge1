FROM golang:1.16 as builder

WORKDIR /app

COPY main.go /app

RUN go build main.go

FROM scratch as final

COPY --from=builder /app/main /

WORKDIR /

ENTRYPOINT ["/main"]