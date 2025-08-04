FROM golang:1.21-alpine as builder
WORKDIR /app
COPY . .
RUN go build -o app

FROM alpine:3.19
WORKDIR /root/
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]