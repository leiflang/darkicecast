
FROM debian:stable-slim

# Install packages
RUN apt-get update && apt-get install -y \
    icecast2 darkice alsa-utils \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m iceuser

# Create directories and set permissions
RUN mkdir -p /etc/icecast2 /etc/icecast2/log /etc/darkice
RUN touch /etc/icecast2/log/access.log /etc/icecast2/log/error.log
RUN chown -R iceuser:iceuser /etc/icecast2/log
# Copy configs
COPY icecast.xml /etc/icecast2/icecast.xml
COPY darkice.cfg /etc/darkice/darkice.cfg
COPY run.sh /run.sh
# Expose Icecast port
EXPOSE 8000

ENTRYPOINT [ "/run.sh" ]