#!/usr/bin/with-contenv bashio
bashio::log.info "Configuring audio input..."
# amixer -c 0 sset 'PCM Capture Source' 'Line'
pactl info