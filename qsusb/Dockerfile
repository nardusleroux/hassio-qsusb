ARG BUILD_FROM=hassioaddons/ubuntu-base:5.2.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base system
RUN \
    apt-get update \
    \
    && apt-get install -y --no-install-recommends \
        jq libusb-1.0 wget unzip \
    \
    && rm -fr \
        /tmp/* \
        /var/{cache,log}/* \
        /var/lib/apt/lists/*

# Copy run.sh script which is used to run qsusb
WORKDIR /qsusb
COPY run.sh .

# Install qsusb
RUN \
    FILE="qsusb_pi_V1.91.zip" \
    && if [ "${BUILD_ARCH}" = "i386" ] \
        || [ "${BUILD_ARCH}" = "amd64" ]; then \
        FILE="QSUSB_linux.zip"; \
    fi \
    \
    && wget https://cdn.shopify.com/s/files/1/1883/0535/files/${FILE} \
    \
    && unzip ${FILE} \
    \
    && rm ${FILE}

# Copy v1.65 of the www directory.  Qwikswitch was contacted to request them to upgrade the Pi and Linux zip files
# with the same version of the www directory as found in the Windows version.  Due to delays on their side, we are
# budling and deploying this with the add-on.  This will be removed once they have updated their zip files.
# The latest version of the www pages allows relays to be put into link mode via the web interface.
COPY www.zip .
RUN \
    chmod a+x run.sh \
    \
    && rm -rf QSUSB/www \
    \
    && unzip www.zip -d QSUSB/ \
    \
    && rm www.zip

CMD [ "run.sh" ]

# Build arguments
ARG BUILD_ARCH=amd64
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="QwikSwitch USB Hub" \
    io.hass.description="Add-on for the QwikSwitch USB Hub" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Nardus le Roux and Glen Verran" \
    org.label-schema.description="Add-on for the QwikSwitch USB Hub" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="QwikSwitch USB Hub" \
    org.label-schema.schema-version="1.0" \
    #org.label-schema.url="" \
    #org.label-schema.usage="" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    #org.label-schema.vcs-url="" \
    org.label-schema.vendor="QwikSwitch"