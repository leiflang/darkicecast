
ARG BUILD_FROM
FROM $BUILD_FROM

# Install packages
RUN apk add --no-cache icecast darkice alsa-utils

# Create non-root user
RUN useradd -m iceuser

# Create directories and set permissions
RUN mkdir -p /etc/icecast2 /etc/icecast2/log /etc/darkice
RUN touch /etc/icecast2/log/access.log /etc/icecast2/log/error.log
RUN chown -R iceuser:iceuser /etc/icecast2/log
# Copy configs
COPY icecast.xml /etc/icecast2/icecast.xml
COPY darkice.cfg /etc/darkice/darkice.cfg
# Expose Icecast port
EXPOSE 8000

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

ENTRYPOINT [ "/run.sh" ]