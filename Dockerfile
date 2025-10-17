FROM debian:stable-slim

# Install packages
RUN apt-get update && apt-get install -y \
    icecast2 darkice supervisor \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m iceuser

# Create directories and set permissions
RUN mkdir -p /etc/icecast2 /etc/darkice /usr/local/icecast \
    && chown -R iceuser:iceuser /etc/icecast2 /etc/darkice /usr/local/icecast

# Create directories for supervisor and give iceuser permission
RUN mkdir -p /var/log/supervisor \
    && chown -R iceuser:iceuser /var/log/supervisor
    
# Create log directory for Icecast and give permissions
RUN mkdir -p /usr/local/icecast/logs \
    && chown -R iceuser:iceuser /usr/local/icecast


# Copy configs
COPY icecast.xml /etc/icecast2/icecast.xml
COPY darkice.cfg /etc/darkice/darkice.cfg
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Switch to non-root user
USER iceuser

# Expose Icecast port
EXPOSE 8000

# Start both services
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]