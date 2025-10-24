#!/usr/bin/with-contenv bashio
# amixer -c 0 sset 'PCM Capture Source' 'Line'
bashio::log.info "Listing Audio Devices..."
bashio::log.info "================================== Audio Device List =================================="
pactl info
pactl list sources short
bashio::log.info "======================================================================================="

bashio::log.info "Configuring audio input..."