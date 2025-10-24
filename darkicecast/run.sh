#!/usr/bin/with-contenv bashio

bashio::log.info "Starting DarkIce and Icecast..."

# Configure audio input
bashio::log.info "Setting up audio input source..."
amixer -c 0 sset 'PCM Capture Source' 'Line'

# Start Icecast in background
bashio::log.info "Starting icecast server..."
/usr/bin/icecast2 -c /etc/icecast2/icecast.xml &

# Start DarkIce in foreground (main process)
bashio::log.info "Starting DarkIce streaming..."
exec /usr/bin/darkice -c /etc/darkice/darkice.cfg

# let the user know everything should be up and running
bashio::log.info "DarkIce and Icecast should now be running."