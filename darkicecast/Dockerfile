ARG BUILD_FROM
FROM $BUILD_FROM

# Install packages (Alpine uses apk)
RUN apk add --no-cache icecast darkice alsa-utils

# Create non-root user (Alpine uses adduser)
RUN adduser -D iceuser

# Create directories and set permissions
RUN mkdir -p /etc/icecast2 /etc/icecast2/log /etc/darkice \
    && touch /etc/icecast2/log/access.log /etc/icecast2/log/error.log \
    && chown -R iceuser:iceuser /etc/icecast2/log

# Copy configs
COPY config/icecast.xml /etc/icecast2/icecast.xml
COPY config/darkice.cfg /etc/darkice/darkice.cfg

# Expose Icecast port
EXPOSE 8000

# Copy run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]