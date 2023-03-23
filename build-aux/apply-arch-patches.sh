#!/bin/bash -ex

# Disable kGlobalMediaControlsCastStartStop by default
# https://crbug.com/1314342
patch -Np1 -i /app/ugc-arch/disable-GlobalMediaControlsCastStartStop.patch

# Enable VAAPI on Wayland
patch -Np1 -i /app/ugc-arch/0001-ozone-wayland-add-VA-API-support.patch
# https://github.com/ungoogled-software/ungoogled-chromium/issues/2228
# https://aur.archlinux.org/cgit/aur.git/tree/?h=ungoogled-chromium
patch -Np1 -i /app/ugc-arch/vaapi-add-av1-support.patch
