FROM alpine:latest

# Install Xray
RUN apk add --no-cache xray ca-certificates

# Create config folder and file
RUN mkdir -p /etc/xray
RUN echo '{"inbounds":[{"port":8080,"protocol":"vless","settings":{"clients":[{"id":"6d2f9a1b-e8c4-4b3a-9d72-f5a81c0e92d7"}],"decryption":"none"},"streamSettings":{"network":"ws","wsSettings":{"path":"/vless-ws"}}}],"outbounds":[{"protocol":"freedom"}]}' > /etc/xray/config.json

# Jalankan Xray dengan port yang benar
CMD ["xray", "-config", "/etc/xray/config.json"]
