FROM alpine:latest
RUN apk add --no-cache ca-certificates bash curl unzip
RUN curl -L -o /xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /xray.zip && \
    chmod +x /xray
COPY config.json /config.json
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
