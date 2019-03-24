#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: MagicMirror²
# Configures MagicMirror²
# ==============================================================================

# Initial config
if ! bashio::fs.file_exists '/config/magicmirror/config.js'; then
    if ! bashio::fs.directory_exists '/config/magicmirror'; then
        mkdir /config/magicmirror
    fi
    cp /opt/config/config.js.sample /config/magicmirror/config.js
fi

if ! bashio::fs.directory_exists '/data/modules'; then
    mkdir /data/modules
    mv /opt/modules/* /data/modules/
    rm -R /opt/modules
fi

if ! bashio::fs.directory_exists '/config/magicmirror/css'; then
    mkdir /config/magicmirror/css
    mv /opt/css/* /config/magicmirror/css
    rm -R /opt/css
fi

# Symlink configfile
ln -sf /config/magicmirror/config.js /opt/config/config.js
ln -sf /data/modules /opt/modules
ln -sf /config/magicmirror/css /opt/css