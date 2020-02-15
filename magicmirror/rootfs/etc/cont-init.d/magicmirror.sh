#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: MagicMirror²
# Configures MagicMirror²
# ==============================================================================
readonly ghurl='https://github.com/'
readonly modules=$(bashio::config 'modules')

# Initial config
if ! bashio::fs.file_exists '/config/magicmirror/config.js'; then
    if ! bashio::fs.directory_exists '/config/magicmirror'; then
        mkdir /config/magicmirror
    fi
    cp /etc/config/default.js /config/magicmirror/config.js
fi

if ! bashio::fs.directory_exists '/config/magicmirror/css'; then
    mkdir /config/magicmirror/css
    mv /opt/css/* /config/magicmirror/css
    rm -R /opt/css
fi

# Symlink configfile
ln -sf /config/magicmirror/config.js /opt/config/config.js
ln -sf /config/magicmirror/css /opt/css

# Install user defined modules

for module in ${modules}; do
    bashio::log.info "Installing ${module}"
    cd /opt/modules || bashio::exit "/opt/modules/ does not exist!"
    git clone "${ghurl}${module}.git"
    modulename=$(echo "$module" | cut -d '/' -f 2)
    cd "${modulename}" || bashio::exit "${modulename} does not exist!"
    npm install --unsafe-perm --silent
done
