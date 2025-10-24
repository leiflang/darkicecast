#!/usr/bin/with-contenv bashio

echo "Starting DarkIce and Icecast..."
# Configure audio input
amixer -c 0 sset 'PCM Capture Source' 'Line'

# Start Icecast in background
/usr/bin/icecast2 -c /etc/icecast2/icecast.xml &

# Start DarkIce in foreground (so container stays alive)
/usr/bin/darkice -c /etc/darkice/darkice.cfg