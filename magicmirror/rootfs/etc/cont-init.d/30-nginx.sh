#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: MagicMirror²
# Configures NGINX for use with MagicMirror²
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

declare certfile
declare keyfile

# Enable SSL
if hass.config.true 'ssl'; then
    certfile=$(hass.config.get 'certfile')
    keyfile=$(hass.config.get 'keyfile')

    sed -i "s/%%certfile%%/${certfile}/g" /etc/nginx/nginx-ssl.conf
    sed -i "s/%%keyfile%%/${keyfile}/g" /etc/nginx/nginx-ssl.conf
fi

# Disables IPv6 in case its disabled by the user
if ! hass.config.true 'ipv6'; then
    sed -i '/listen \[::\].*/ d' /etc/nginx/nginx.conf
fi