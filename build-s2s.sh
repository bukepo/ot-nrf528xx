#!/bin/bash
set -euxo pipefail
./script/build nrf52840 USB_trans -DOT_BOOTLOADER=USB \
    -DOT_BUILD_GTEST=OFF \
    -DOT_CHANNEL_MANAGER=OFF \
    -DOT_CHANNEL_MONITOR=OFF \
    -DOT_CSL_PEER=ON \
    -DOT_DNSSD_SERVER=ON \
    -DOT_DNS_CLIENT=ON \
    -DOT_ECDSA=ON \
    -DOT_PING_SENDER=ON \
    -DOT_SERVICE=ON \
    -DOT_SRP_CLIENT=ON \
    -DOT_SRP_SERVER=ON \
    -DOT_TIME_SYNC=OFF \
    -DOT_WAKEUP_COORDINATOR=ON \
    -DOT_WAKEUP_END_DEVICE=ON \
    -DOT_CSL_RECEIVER=ON

./nrf52840-hex-dongle.sh
nrfutil pkg generate --debug-mode --hw-version 52 --sd-req 0 --application ot-cli-ftd-dongle.hex --key-file private.pem ot-cli-ftd-dongle.zip
nrfutil pkg generate --debug-mode --hw-version 52 --sd-req 0 --application ot-rcp-dongle.hex --key-file private.pem ot-rcp-dongle.zip
