FROM alpine:latest
RUN apk add --no-cache xray ca-certificates
RUN echo '{"inbounds":[{"port":8080,"protocol":"vless","settings":{"clients":[{"id":"6d2f9a1b-e8c4-4b3a-9d72-f5a81c0e92d7"}],"decryption":"none"},"streamSettings":{"network":"ws","wsSettings":{"path":"/vless-ws"}}}],"outbounds":[{"protocol":"freedom"}]}' > /etc/config.json
ENTRYPOINT ["xray", "-config", "/etc/config.json"]
