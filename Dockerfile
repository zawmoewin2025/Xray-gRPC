# Base image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache ca-certificates curl unzip

# Set working directory
WORKDIR /app

# Download Xray-core (latest release)
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip \
    && chmod +x xray \
    && rm -f xray.zip

# Copy the config file into container
COPY config.json /app/config.json

# Run Xray with the config
CMD ["sh", "-c", "./xray run -config /app/config.json"]
