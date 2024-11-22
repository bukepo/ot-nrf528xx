#!/bin/bash
set -euxo pipefail
OT_CMAKE_BUILD_DIR=build-dk  ./script/build nrf52840 UART_trans \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DOT_LOG_MAX_SIZE=512 \
    -DRTT_BUFFER_SIZE=2048 \
    -DOT_BUILD_GTEST=OFF \
    -DOT_CHANNEL_MANAGER=OFF \
    -DOT_CHANNEL_MONITOR=OFF \
    -DOT_CSL_PEER=ON \
    -DOT_DNSSD_SERVER=ON \
    -DOT_DNS_CLIENT=ON \
    -DOT_ECDSA=ON \
    -DOT_FULL_LOGS=ON \
    -DOT_PING_SENDER=ON \
    -DOT_SERVICE=ON \
    -DOT_SRP_CLIENT=ON \
    -DOT_SRP_SERVER=ON \
    -DOT_TIME_SYNC=OFF \
    -DOT_WAKEUP_COORDINATOR=ON \
    -DOT_WAKEUP_END_DEVICE=ON \
    -DOT_CSL_RECEIVER=ON

arm-none-eabi-objcopy -O ihex build-dk/bin/ot-cli-ftd ot-cli-ftd-dk.hex
