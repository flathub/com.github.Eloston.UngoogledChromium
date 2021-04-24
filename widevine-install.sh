#!/usr/bin/env bash

# Exit on error and forbid unset variables
set -eu

# Get latest WideVine Version by getting last line in https://dl.google.com/widevine-cdm/versions.txt
_widevine_ver="$(wget -qO- https://dl.google.com/widevine-cdm/versions.txt | tail -n1)"

# Get the architecture of the current machine
ARCH="$(uname -m)"
case "$ARCH" in
	x86_64) WIDEVINE_ARCH="x64"
		CHROMIUM_ARCH="x64"
		;;

	*)	echo "The architecture $ARCH is not supported." >&2
		exit 1
		;;
esac

# Download WideVine into a temporary file and use trap to delete it on exit
widevine_zip="$(mktemp)"
trap 'rm -f "${widevine_zip:?}"' EXIT
wget -O "$widevine_zip" "https://dl.google.com/widevine-cdm/${_widevine_ver}-linux-${WIDEVINE_ARCH}.zip"

# Install WideVine from zip file into UngoogledChromium flatpak
_install_prefix="$HOME/.var/app/com.github.Eloston.UngoogledChromium/config/chromium/WidevineCdm/${_widevine_ver}"
unzip -p "$widevine_zip" libwidevinecdm.so | install -Dm644 "/dev/stdin" "${_install_prefix}/_platform_specific/linux_$CHROMIUM_ARCH/libwidevinecdm.so"
unzip -p "$widevine_zip" manifest.json     | install  -m644 "/dev/stdin" "${_install_prefix}/manifest.json"
unzip -p "$widevine_zip" LICENSE.txt       | install  -m644 "/dev/stdin" "${_install_prefix}/LICENSE.txt"
