# Stage 1: Build the Go binary
FROM golang:1.23.2 AS builder

# Set the working directory
WORKDIR /app

# Copy the Go modules files
COPY go.mod ./

# Download dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the application
RUN go build -o main ./cmd/server/main.go

# Stage 2: Create a minimal runtime image
FROM alpine:latest

# Set the working directory
WORKDIR /root/

# Copy the compiled binary from the builder
COPY --from=builder /app/main .

# Expose the port (adjust if your app uses another port)
EXPOSE 8080

# Command to run the app
CMD ["./main"]
