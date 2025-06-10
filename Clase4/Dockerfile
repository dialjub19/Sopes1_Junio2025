FROM golang

WORKDIR /app

COPY go.mod go.sum  ./

RUN go mod download

COPY . .

RUN CGO_ENABLE=0 GOOS=linux go build -o /docker-go

EXPOSE 6000

CMD ["/docker-go"]