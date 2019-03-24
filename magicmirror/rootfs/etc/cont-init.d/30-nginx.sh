#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: MagicMirror²
# Configures NGINX for use with MagicMirror²
# ==============================================================================

declare certfile
declare keyfile

# Enable SSL
if bashio::config.true 'ssl'; then
    certfile=$(bashio::config 'certfile')
    keyfile=$(bashio::config 'keyfile')

    sed -i "s/%%certfile%%/${certfile}/g" /etc/nginx/nginx-ssl.conf
    sed -i "s/%%keyfile%%/${keyfile}/g" /etc/nginx/nginx-ssl.conf
fi

# Disables IPv6 in case its disabled by the user
if ! bashio::config.true 'ipv6'; then
    sed -i '/listen \[::\].*/ d' /etc/nginx/nginx.conf
fi