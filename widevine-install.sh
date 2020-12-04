#!/bin/bash -eux

# Get latest WideVine Version
_widevine_ver="$(wget -qO- https://dl.google.com/widevine-cdm/versions.txt | tail -n1)"

# Make temporary directory for download
_mktemp_dir="$(mktemp -d)"
cd "$_mktemp_dir"

# Use the architecture of the current machine or whatever the user has set
# externally
ARCH="${ARCH:-$(uname -m)}"
case "$ARCH" in
  x86_64) WIDEVINE_ARCH="x64"; CHROMIUM_ARCH="x64" ;;
    i?86) WIDEVINE_ARCH="ia32"; CHROMIUM_ARCH="x86" ;;
       *) echo "The architecture $ARCH is not supported." >&2 ; exit 1 ;;
esac

# Download and unzip widevine
wget -c -O widevine.zip "https://dl.google.com/widevine-cdm/${_widevine_ver}-linux-${WIDEVINE_ARCH}.zip"
unzip      widevine.zip

# Install to UngoogledChromium flatpak
_install_prefix="$HOME/.var/app/com.github.Eloston.UngoogledChromium/config/chromium/WidevineCdm/${_widevine_ver}"
install -Dm644 libwidevinecdm.so   "${_install_prefix}/_platform_specific/linux_$CHROMIUM_ARCH/libwidevinecdm.so"
install  -m644       manifest.json "${_install_prefix}/manifest.json"
install  -m644        LICENSE.txt  "${_install_prefix}/LICENSE.txt"

# Remove temporary directory
cd / && rm -rf "$_mktemp_dir"
