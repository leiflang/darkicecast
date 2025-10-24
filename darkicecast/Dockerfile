ARG BUILD_FROM
FROM $BUILD_FROM

# Install packages
RUN apk add --no-cache icecast darkice pulseaudio-utils

# Create non-root user
RUN adduser -D iceuser

# Create directories and set permissions
RUN mkdir -p /etc/icecast2 /etc/icecast2/log /etc/darkice \
    && touch /etc/icecast2/log/access.log /etc/icecast2/log/error.log \
    && chown -R iceuser:iceuser /etc/icecast2/log

# Copy configs
COPY config/icecast.xml /etc/icecast2/icecast.xml
COPY config/darkice.cfg /etc/darkice/darkice.cfg

# Copy service scripts and init scripts
COPY rootfs/ /

# Set executable permissions for s6 service scripts
RUN chmod +x /etc/services.d/icecast/run \
    && chmod +x /etc/services.d/darkice/run \
    && chmod +x /etc/cont-init.d/10-audio.sh

# Expose Icecast port
EXPOSE 8000