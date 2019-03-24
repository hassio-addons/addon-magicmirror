ARG BUILD_FROM=hassioaddons/base:3.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set ENV
ENV MM_VERSION="v2.6.0" \
    MMM_HASS='7d0063b0bdfffc9b8d4c751fb31dc0ea0f4e39e4'

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Sets working directory
WORKDIR /opt

# Setup base
RUN \
  apk add --no-cache \
    nodejs=10.14.2-r0 \
    npm=10.14.2-r0 \
    nginx=1.14.2-r0 \
    lua-resty-http=0.12-r1 \
    nginx-mod-http-lua=1.14.2-r0 \
    git=2.20.1-r0 \
    jq \
  && cd /opt \
  && git clone --branch "${MM_VERSION}" --depth=1 \
    https://github.com/MichMich/MagicMirror.git /opt \
  && npm install --unsafe-perm \
  \
  && git clone https://github.com/aserramonner/MMM-HASS.git /tmp/MMM_HASS \
  && cd /tmp/MMM_HASS \
  && git checkout "${MMM_HASS}" \
  && mv /tmp/MMM_HASS /opt/modules/ \
  && npm install --unsafe-perm

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
