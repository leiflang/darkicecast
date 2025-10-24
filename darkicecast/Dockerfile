
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
COPY /darkicecasticecast.xml /etc/icecast2/icecast.xml
COPY /darkicecastdarkice.cfg /etc/darkice/darkice.cfg
# Expose Icecast port
EXPOSE 8000

# Copy data for add-on
COPY /darkicecast/run.sh /
RUN chmod a+x /run.sh

ENTRYPOINT [ "/run.sh" ]