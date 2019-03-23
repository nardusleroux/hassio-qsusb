ARG BUILD_FROM=hassioaddons/ubuntu-base:3.0.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
ARG BUILD_ARCH=amd64
WORKDIR /qsusb

# Install requirements for add-on
RUN \
    FILE="qsusb_pi_V1.91.zip" \
    && if [ "${BUILD_ARCH}" = "armhf" ] \
        || [ "${BUILD_ARCH}" = "armv7" ] \
        || [ "${BUILD_ARCH}" = "aarch64" ]; then \
        FILE="qsusb_pi_V1.91.zip"; \
    fi \
    && if [ "${BUILD_ARCH}" = "i386" ] \
        || [ "${BUILD_ARCH}" = "amd64" ]; then \
        FILE="QSUSB_linux.zip"; \
    fi \
    && apt-get update \
    \
    && apt-get install -y --no-install-recommends \
        libusb-1.0 \
        unzip \
        wget \
        jq \
    \
    && wget https://cdn.shopify.com/s/files/1/1883/0535/files/${FILE} \
    \
    && unzip ${FILE}

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

# Build arugments
ARG BUILD_ARCH
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
