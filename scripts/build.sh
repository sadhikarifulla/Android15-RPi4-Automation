#!/bin/bash
set -euo pipefail

echo "=========================================="
echo " Android 15 Raspberry Pi 4 Build"
echo "=========================================="

export OUT_DIR=/home/scl/aosp/out-jenkins

echo "Cleaning output directory..."
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

cd /home/scl/aosp

source build/envsetup.sh
lunch aosp_rpi4-ap4a-userdebug

echo "User    : $(whoami)"
echo "OUT_DIR : $OUT_DIR"

echo "Starting Android build..."
m -j4

echo "Build completed successfully."

mkdir -p "$WORKSPACE/artifacts"
cp "$OUT_DIR"/target/product/rpi4/*.img "$WORKSPACE/artifacts/"
