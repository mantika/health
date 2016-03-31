FROM golang

# Copy the runtime dockerfile into the context as Dockerfile
COPY Dockerfile.run /go/bin/Dockerfile

COPY . /go/src/github.com/mantika/health

WORKDIR /go/src/github.com/mantika/health

RUN go get -v -d ./...

RUN CGO_ENABLED=0 go build -a -installsuffix nocgo -o /go/bin/health .

# Set the workdir to be /go/bin which is where the binaries are built
WORKDIR /go/bin

# Export the WORKDIR as a tar stream
CMD tar -cf - .
