FROM alpine:latest
RUN apk add --no-cache ca-certificates curl unzip
WORKDIR /app
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip && chmod +x xray && rm -f xray.zip
COPY config.json /app/config.json
CMD ["./xray", "run", "-config", "/app/config.json"]
