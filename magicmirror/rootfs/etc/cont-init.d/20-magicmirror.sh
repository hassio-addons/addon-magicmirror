#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: MagicMirror²
# Configures MagicMirror²
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

# Initial config
if ! hass.file_exists '/config/magicmirror/config.js'; then
    if ! hass.directory_exists '/config/magicmirror'; then
        mkdir /config/magicmirror
    fi
    cp /opt/config/config.js.sample /config/magicmirror/config.js
fi

if ! hass.directory_exists '/data/modules'; then
    mkdir /data/modules
    mv /opt/modules/* /data/modules/
    rm -R /opt/modules
fi

if ! hass.directory_exists '/config/magicmirror/css'; then
    mkdir /config/magicmirror/css
    mv /opt/css/* /config/magicmirror/css
    rm -R /opt/css
fi

# Install additional modules

if hass.config.has_value 'custom_modules'; then
    for module in $(hass.config.get 'custom_modules'); do
        name=$(echo "$module" | awk -F'/' ' { print $NF }')
        if ! hass.directory_exists '/data/modules/$name'; then
            hass.log.info "Installing custom module: ${name}"
            mkdir /data/modules/"$name"
            git clone $module".git" /data/modules/"$name"
            cd /data/modules/"$name"
            npm install --unsafe-perm --silent
        fi
    done
fi

# Symlink configfile
ln -sf /config/magicmirror/config.js /opt/config/config.js
ln -sf /data/modules /opt/modules
ln -sf /config/magicmirror/css /opt/css