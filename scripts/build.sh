#!/bin/bash
set -e

echo "=========================================="
echo " Android 15 Raspberry Pi 4 Build"
echo "=========================================="

export OUT_DIR=/home/scl/aosp/out-jenkins

cd /home/scl/aosp

echo "Loading Android build environment..."
source build/envsetup.sh

echo "Selecting lunch target..."
lunch aosp_rpi4-ap4a-userdebug

echo "Starting Android build..."
m -j8

echo "Build completed successfully."
