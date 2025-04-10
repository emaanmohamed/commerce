# Use official Golang image
FROM golang:1.21

# Set working directory inside container
WORKDIR /app

# Copy Go modules and download deps
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the code
COPY . .

# Build the Go app
RUN go build -o main ./cmd/main.go

# Expose the port (optional)
EXPOSE 8080

# Command to run
CMD ["./main"]
