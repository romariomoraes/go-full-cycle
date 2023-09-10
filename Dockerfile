FROM golang:1.16 AS build
WORKDIR /app
COPY print.go .
RUN go build -o my-app print.go

FROM scratch
WORKDIR /
COPY --from=build /app/my-app /
CMD ["/my-app"]