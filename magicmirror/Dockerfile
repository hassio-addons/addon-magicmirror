ARG BUILD_FROM=hassioaddons/base:2.3.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set ENV
ENV MM_VERSION = "v2.4.1"

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Sets working directory
WORKDIR /opt

# Setup base
RUN \
  apk add --no-cache \
    nodejs=8.14.0-r0 \
    npm=8.14.0-r0 \
    apache2-utils=2.4.35-r0 \
    nginx=1.14.0-r1 \
    lua-resty-http=0.12-r1 \
    nginx-mod-http-lua=1.14.0-r1 \
  && apk add --no-cache --virtual .build-dependencies \
    git=2.18.1-r0 \
  && cd /opt \
  && git clone https://github.com/MichMich/MagicMirror.git /opt \
  && npm install --unsafe-perm \
  && apk del --purge .build-dependencies

# Copy root filesystem
COPY rootfs /

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="MagicMirror²" \
    io.hass.description="MagicMirror² is an open source modular smart mirror platform." \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Joakim Sørensen @ludeeus <ludeeus@gmail.com>" \
    org.label-schema.description="MagicMirror² is an open source modular smart mirror platform." \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="MagicMirror²" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://community.home-assistant.io/t/community-hass-io-add-on-magicmirror/XXXX" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-magicmirror/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-magicmirror" \
    org.label-schema.vendor="Community Hass.io Add-ons"
