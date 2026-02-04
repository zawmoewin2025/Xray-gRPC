FROM alpine:latest

RUN apk add --no-cache ca-certificates curl unzip gettext

WORKDIR /app

# Download Xray
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip \
    && chmod +x xray \
    && rm -f xray.zip

COPY config.json /app/config.template.json

# Railway ရဲ့ PORT ကို config ထဲ ထည့်သွင်းပြီး run မယ်
CMD envsubst < /app/config.template.json > /app/config.json && ./xray run -config /app/config.json
