FROM debian:stable-slim

# Install packages
RUN apt-get update && apt-get install -y \
    icecast2 darkice alsa-utils supervisor \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m iceuser

# Give the new user permission to read from the audio devices
# RUN usermod -aG audio iceuser

# Create directories and set permissions
RUN mkdir -p /etc/icecast2 /etc/icecast2/log /etc/darkice

# create the icecast log files
RUN touch /etc/icecast2/log/access.log /etc/icecast2/log/error.log

# provide ownership of the files to iceuser
RUN chown -R iceuser:iceuser /etc/icecast2/log

# Create directories for supervisor and give iceuser permission
RUN mkdir -p /var/log/supervisor 

# Copy configs
COPY icecast.xml /etc/icecast2/icecast.xml
COPY darkice.cfg /etc/darkice/darkice.cfg
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose Icecast port
EXPOSE 8000

# Start both services
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]