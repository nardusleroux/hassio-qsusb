ARG BUILD_FROM=hassioaddons/ubuntu-base:5.2.1
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        jq \
        libusb-1.0 \
        wget \
        unzip && \
    rm -rf \
        /tmp/* \
        /var/{cache,log}/* \
        /var/lib/apt/lists/*

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Prepare working directory
WORKDIR /qsusb
COPY run.sh .
RUN chmod +x run.sh

# Install qsusb
RUN \
    case "${BUILD_ARCH}" in \
        armv7|armhf) FILE="qsusb_pi_V1.91_arm32.zip" ;; \
        i386|amd64) FILE="qsusb_linux_V1.91_x86.zip" ;; \
        *)          FILE="qsusb_pi_V1.91_arm64.zip" ;; \
    esac && \
    wget "https://cdn.shopify.com/s/files/1/1883/0535/files/${FILE}" && \
    unzip "${FILE}" && \
    rm -f "${FILE}" && \
    echo "FILE=${FILE}" > /qsusb/env.txt && \
    printenv | grep BUILD >> /qsusb/env.txt

# Handle Linux version folder structure
RUN \
    if [ -d ./QSUSB_linux ]; then \
        mv ./QSUSB_linux/QSUSB . && \
        chmod a+x ./QSUSB/qsusb* ; \
    fi

# Default command
CMD ["./run.sh"]

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
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vendor="QwikSwitch"
